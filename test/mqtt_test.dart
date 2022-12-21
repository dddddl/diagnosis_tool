import 'package:diagnosis_tool/data/mqtt/mqtt_client.dart';
import 'package:diagnosis_tool/domain/observer.dart';
import 'package:diagnosis_tool/iot/utils/time_util.dart';

void main() {
  String result = TimeZoneUtil.createGmtOffsetString(true, true, DateTime.now().timeZoneOffset.inMilliseconds);
  print(result);

  // MqttClient.instance.connectWithPort().then((value) {
  //   if (value) {
  //     MqttClient.instance
  //         .subscribeMsg(SubscribeParams(['/test/topic', '/test/topic2']));
  //     MqttClient.instance.execute(_test(), SubscribeParams(['/test/topic']));
  //     SubscribeParams test2 = SubscribeParams(['/test/topic2']);
  //     MqttClient.instance.execute(_test1(), SubscribeParams(['/test/topic2']));
  //     MqttClient.instance.unsubscribeMsg(SubscribeParams(['/test/topic2']));
  //     MqttClient.instance.pubMsg(
  //         PublishParams('/test/topic', '11111111111111111111111111111'));
  //     MqttClient.instance.pubMsg(
  //         PublishParams('/test/topic2', '22222222222222222222222222222'));
  //
  //     SubscribeParams params = SubscribeParams(['/test/topic']);
  //     SubscribeParams params1 = SubscribeParams(['/test/topic']);
  //     print(params == params1);
  //   }
  // });
}

class _test1 extends Observer<String> {
  @override
  void onComplete() {
    print('_test1 onComplete');
  }

  @override
  void onError(e) {
    print(e);
  }

  @override
  void onNext(String? response) {
    print('_test1 onNext: $response');
  }
}

class _test extends Observer<String> {
  @override
  void onComplete() {
    print('_test1 onComplete');
  }

  @override
  void onError(e) {
    print(e);
  }

  @override
  void onNext(String? response) {
    print('onNext: $response');
  }
}
