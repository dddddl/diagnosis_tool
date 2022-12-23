import 'dart:convert';

import 'package:diagnosis_tool/domain/entities/machine_state.dart';
import 'package:diagnosis_tool/domain/entities/mqtt_entity.dart';
import 'package:diagnosis_tool/domain/entities/robot_map.dart';
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

void mapMqttEntityToCmd(MqttEntity mqttEntity) {
  if (mqttEntity.cmd == "data") {
    RobotState robotState = RobotState.fromJson(mqttEntity.data);
    eventBus.fire(mapRobotStateToMachine(robotState));
  } else if (mqttEntity.cmd == "map") {}
}

RobotState mapRobotStateToMachine(RobotState robotState) {
  final state = robotState.state ?? 0;

  MachineState machineState;

  if (state == 0x01) {
    machineState = MachineState.locked;
  } else if (state == 0x02) {
    machineState = MachineState.locked;
  } else if (state == 0x03) {
    machineState = MachineState.locked;
  } else if (state == 0x04) {
    machineState = MachineState.locked;
  } else if (state == 0x05) {
    machineState = MachineState.locked;
  } else if (state == 0x02) {
    machineState = MachineState.locked;
  } else if (state == 0x02) {
    machineState = MachineState.locked;
  } else {
    machineState = MachineState.locked;
  }

  robotState = robotState.copyWith(machineState: machineState);

  return robotState;
}
