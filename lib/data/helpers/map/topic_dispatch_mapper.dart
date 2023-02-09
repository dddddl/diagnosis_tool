import 'dart:convert';

import 'package:diagnosis_tool/domain/entities/app_mqtt_connect_status.dart';
import 'package:diagnosis_tool/domain/entities/mqtt_entity.dart';
import 'package:diagnosis_tool/domain/entities/thing_cmd_entity.dart';
import 'package:diagnosis_tool/domain/entities/thing_event_entity.dart';
import 'package:diagnosis_tool/iot/utils/log_utils.dart';

import 'mqtt_entity_mapper.dart';

void dispatchTopic(String topic, String content) {
  if (topic.contains("/app/down/")) {
    // 老协议、cmd为string
    MqttEntity entity = MqttEntity.fromJson(json.decode(content));
    mapMqttEntityToCmd(entity);
  } else if (topic.contains('/mower/up/')) {
    // 老协议、cmd为string
    MqttEntity entity = MqttEntity.fromJson(json.decode(content));
    mapMqttEntityToCmd(entity);
  } else if (topic.contains('/thing/up/property')) {
    // 上报属性, 新协议
    ThingCmdEntity entity = ThingCmdEntity.fromJson(json.decode(content));
    mapThingCmdEntityToCmd(entity);
  } else if (topic.contains('/thing/up/event')) {
    // 上报事件, 新协议
    ThingEventEntity entity = ThingEventEntity.fromJson(json.decode(content));
    if (entity.eventType == 'info') {
      // 机器人上报的信息
    } else if (entity.eventType == 'alert') {
      // 机器人上报的警告
      var param = entity.param as String;
      RobotNotify robotNotify = RobotNotify(param);
      eventBus.fire(robotNotify);
    } else if (entity.eventType == 'error') {
      // 机器人上报的错误
      var param = entity.param as String;
      RobotNotify robotNotify = RobotNotify(param);
      eventBus.fire(robotNotify);
    }
  } else if (topic.contains('/thing/up/action')) {
    // 上报动作, 新协议
  }
}
