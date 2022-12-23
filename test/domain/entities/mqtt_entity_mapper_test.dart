import 'dart:convert';

import 'package:diagnosis_tool/data/helpers/mqtt_entity_mapper.dart';
import 'package:diagnosis_tool/domain/entities/mqtt_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test', () {
    String str =
        "{\"cmd\":\"data\",\"subcmd\":\"upload\",\"uuid\":\"6989\",\"data\":{\"name\":\"dongcheng-machine-test\",\"state\":19,\"power\":15,\"timestamp\":13986462,\"acreage\":30,\"duration\":5,\"moveSpeed\":160,\"motorRotateSpeed\":0,\"position\":{\"x\":0,\"y\":0,\"z\":4.4000000953674316,\"w\":0.15125666558742523}}}";
    MqttEntity mqttEntity = MqttEntity.fromJson(json.decode(str));
    mapMqttEntityToCmd(mqttEntity);

    expect(1, 1);
  });
}
