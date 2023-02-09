import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:diagnosis_tool/data/helpers/map/mqtt_entity_mapper.dart';
import 'package:diagnosis_tool/data/helpers/map/topic_dispatch_mapper.dart';
import 'package:diagnosis_tool/domain/composite_subscription.dart';
import 'package:diagnosis_tool/domain/composite_subscription_map.dart';
import 'package:diagnosis_tool/domain/entities/app_mqtt_connect_status.dart';
import 'package:diagnosis_tool/domain/entities/mqtt_entity.dart';
import 'package:diagnosis_tool/domain/entities/thing_cmd_entity.dart';
import 'package:diagnosis_tool/domain/observer.dart';
import 'package:diagnosis_tool/iot/utils/log_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:uuid/uuid.dart';

class MqttClient {
  MqttClient._() {
    _disposables = CompositeSubscriptionMap<SubscribeParams>();
  }

  static final MqttClient _instance = MqttClient._();

  static MqttClient get instance => _instance;

  ///
  late CompositeSubscriptionMap _disposables;

  ///  mqtt client
  MqttServerClient? _client;
  bool _connected = false;
  final Map<SubscribeParams, StreamSubscription<dynamic>> _subscriptionsMap =
      {};

  Future<bool> connectWithPort() async {
    if (_connected) {
      return true;
    }
    var uuid = Uuid();
    _client = MqttServerClient.withPort(
        'robot.china-dongcheng.com', uuid.v1(), 15479);

    _client?.keepAlivePeriod = 20;
    // Set the protocol to V3.1.1 for AWS IoT Core, if you fail to do this you will not receive a connect ack with the response code
    _client?.setProtocolV311();
    // logging if you wish
    _client?.logging(on: false);
    _client?.onConnected = onConnected;
    _client?.onDisconnected = onDisconnected;
    _client?.onUnsubscribed = onUnsubscribed;
    _client?.onSubscribed = onSubscribed;
    _client?.onSubscribeFail = onSubscribeFail;
    _client?.pongCallback = pong;
    _client?.resubscribeOnAutoReconnect = true;
    _client?.autoReconnect = true;

    final connMess = MqttConnectMessage()
        // .withClientIdentifier('<your_client_id>')
        // .authenticateAs('admin', '123456')
        .withWillTopic('willtopic')
        .withWillMessage('Will message')
        .startClean();
    _client?.connectionMessage = connMess;

    // Connect the client
    try {
      LogUtils.log('MQTT client connecting to AWS IoT using certificates....');
      MqttClientConnectionStatus? status = await _client?.connect();
      _connected = (status?.state == MqttConnectionState.connected);
      return _connected;
    } on Exception catch (e) {
      LogUtils.log('MQTT client exception - $e');
      _client?.disconnect();
      _connected = false;
      return false;
    }
  }

  void pubMsg(PublishParams params) {
    if (_client?.connectionStatus?.state == MqttConnectionState.connected) {
      String topic = params.topic;
      final builder = MqttClientPayloadBuilder();
      builder.addString(params.message);
      LogUtils.log(
          'sending message to topic: $topic  message: ${params.message}');
      // Important: AWS IoT Core can only handle QOS of 0 or 1. QOS 2 (exactlyOnce) will fail!
      _client?.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
    } else {
      LogUtils.log(
          'ERROR MQTT client connection failed - disconnecting, state is ${_client?.connectionStatus?.state}');
      _client?.disconnect();
    }
  }

  Future<bool> subscribeMsg(SubscribeParams params) async {
    try {
      return params.topics.every((element) =>
          _client?.subscribe(element, MqttQos.atLeastOnce) != null);
    } catch (e) {
      return false;
    }
  }

  void unsubscribeMsg(SubscribeParams params) {
    _disposeSubscription(params);
    if (_client?.connectionStatus?.state == MqttConnectionState.connected) {
      for (var element in params.topics) {
        _client?.unsubscribe(element);
      }
    }
  }

  void listen(SubscribeParams params) {
    if (_client != null &&
        _client?.connectionStatus?.state == MqttConnectionState.connected) {
      final subscription =
          _client?.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        if (params.topics.contains(c[0].topic)) {
          final recMess = c[0].payload as MqttPublishMessage;
          final pt =
              MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
          LogUtils.log('topic: ${c[0].topic}  content: $pt');

          dispatchTopic(c[0].topic, pt);
        }
      });

      _addSubscription(params, subscription!);
    }
  }

  void execute(Observer<String> observer, SubscribeParams params) async {
    if (_client != null &&
        _client?.connectionStatus?.state == MqttConnectionState.connected) {
      StreamSubscription<List<MqttReceivedMessage<MqttMessage>>>? subscription =
          _client?.updates!.listen((List<MqttReceivedMessage<MqttMessage>> c) {
        LogUtils.log('topic is <${c[0].topic}>');
        if (params.topics.contains(c[0].topic)) {
          final recMess = c[0].payload as MqttPublishMessage;
          final pt =
              MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

          observer.onNext(pt);
        }
      }, onDone: observer.onComplete, onError: observer.onError);

      _addSubscription(params, subscription!);
    }
  }

  // 连接成功
  void onConnected() {
    LogUtils.log('Connected');
    eventBus.fire(AppMqttConnectStatus(true));
  }

// 连接断开
  void onDisconnected() {
    LogUtils.log('Disconnected');
    eventBus.fire(AppMqttConnectStatus(false));
  }

// 订阅主题成功
  void onSubscribed(String topic) {
    LogUtils.log('Subscribed topic: $topic');
    eventBus.fire(AppMqttConnectStatus(true));
  }

// 订阅主题失败
  void onSubscribeFail(String topic) {
    LogUtils.log('Failed to subscribe $topic');
  }

// 成功取消订阅
  void onUnsubscribed(String? topic) {
    LogUtils.log('Unsubscribed topic: $topic');
  }

// 收到 PING 响应
  void pong() {
    LogUtils.log('Ping response client callback invoked');
  }

  /// Disposes (unsubscribes) from the [Stream]
  void dispose() {
    if (!_disposables.isDisposed) {
      _disposables.dispose();
    }

    _client?.disconnect();
  }

  /// Adds a [StreamSubscription] i.e. the subscription to the
  /// [Stream] to the [CompositeSubscription] list of subscriptions.
  void _addSubscription(
      SubscribeParams params, StreamSubscription subscription) {
    if (_disposables.isDisposed) {
      _disposables = CompositeSubscriptionMap<SubscribeParams>();
    }
    _disposables.add(params, subscription);
  }

  void _disposeSubscription(SubscribeParams params) {
    _disposables.remove(params);
  }
}

class SubscribeParams {
  final List<String> topics;

  SubscribeParams(this.topics);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscribeParams &&
            (identical(other.topics, topics) ||
                const DeepCollectionEquality().equals(other.topics, topics)));
  }

  @override
  int get hashCode {
    var result = 17;
    topics.forEach((element) {
      result = 37 * result + element.hashCode;
    });
    return result;
  }
}

class PublishParams {
  final String topic;
  final String message;

  PublishParams(this.topic, this.message);
}
