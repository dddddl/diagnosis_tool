import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:diagnosis_tool/data/helpers/mqtt_entity_mapper.dart';
import 'package:diagnosis_tool/domain/composite_subscription.dart';
import 'package:diagnosis_tool/domain/composite_subscription_map.dart';
import 'package:diagnosis_tool/domain/entities/mqtt_entity.dart';
import 'package:diagnosis_tool/domain/entities/thing_cmd_entity.dart';
import 'package:diagnosis_tool/domain/observer.dart';
import 'package:diagnosis_tool/iot/utils/log_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:uuid/uuid.dart';

void main() {
  MqttClient.instance.connectWithPort().then((value) {
    if (value) {
      MqttClient.instance
          .subscribeMsg(SubscribeParams(['/test/topic', '/test/topic2']));
      MqttClient.instance.execute(_test(), SubscribeParams(['/test/topic']));
      SubscribeParams test2 = SubscribeParams(['/test/topic2']);
      MqttClient.instance.execute(_test1(), SubscribeParams(['/test/topic2']));
      MqttClient.instance.unsubscribeMsg(SubscribeParams(['/test/topic2']));
      MqttClient.instance.pubMsg(
          PublishParams('/test/topic', '11111111111111111111111111111'));
      MqttClient.instance.pubMsg(
          PublishParams('/test/topic2', '22222222222222222222222222222'));

      SubscribeParams params = SubscribeParams(['/test/topic']);
      SubscribeParams params1 = SubscribeParams(['/test/topic']);
      LogUtils.log(params == params1);
    }
  });
}

class _test1 extends Observer<String> {
  @override
  void onComplete() {
    LogUtils.log('_test1 onComplete');
  }

  @override
  void onError(e) {
    LogUtils.log(e);
  }

  @override
  void onNext(String? response) {
    LogUtils.log('_test1 onNext: $response');
  }
}

class _test extends Observer<String> {
  @override
  void onComplete() {
    LogUtils.log('_test1 onComplete');
  }

  @override
  void onError(e) {
    LogUtils.log(e);
  }

  @override
  void onNext(String? response) {
    LogUtils.log('onNext: $response');
  }
}

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
    _client = MqttServerClient.withPort('10.9.9.46', uuid.v1(), 1883);

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
        .authenticateAs('admin', '123456')
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
          try {
            // 老协议、cmd为string
            MqttEntity entity = MqttEntity.fromJson(json.decode(pt));
            mapMqttEntityToCmd(entity);
          } catch (e) {
            try {
              LogUtils.log('topic is <${c[0].topic}>  content： $pt');
              // 新协议、cmd为json
              ThingCmdEntity entity = ThingCmdEntity.fromJson(json.decode(pt));
              mapThingCmdEntityToCmd(entity);
            } catch (e) {
              LogUtils.log('topic is <${c[0].topic}>  content： $pt');
            }
          }
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
  }

// 连接断开
  void onDisconnected() {
    LogUtils.log('Disconnected');
  }

// 订阅主题成功
  void onSubscribed(String topic) {
    LogUtils.log('Subscribed topic: $topic');
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
