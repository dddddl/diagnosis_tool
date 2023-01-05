import 'dart:convert';

import 'package:diagnosis_tool/domain/entities/machine_state.dart';
import 'package:diagnosis_tool/domain/entities/mqtt_entity.dart';
import 'package:diagnosis_tool/domain/entities/robot_map_entity.dart';
import 'package:diagnosis_tool/domain/entities/robot_status_entity.dart';
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

void mapMqttEntityToCmd(MqttEntity mqttEntity) {
  if (mqttEntity.cmd == "data") {
    RobotState robotState = RobotState.fromJson(mqttEntity.data);
    eventBus.fire(mapRobotStateToMachine(robotState));
  } else if (mqttEntity.cmd == "map") {
    RobotMapEntity robotState = RobotMapEntity.fromJson(mqttEntity.data);
    eventBus.fire(robotState);
  }
}

RobotState mapRobotStateToMachine(RobotState robotState) {
  final state = robotState.state ?? 0;

  MachineState machineState;

  if (state == 0x01) {
    machineState = MachineState.locked;
  } else if (state == 0x11) {
    machineState = MachineState.standby;
  } else if (state == 0x12) {
    machineState = MachineState.mapping;
  } else if (state == 0x13) {
    machineState = MachineState.mowing;
  } else if (state == 0x14) {
    machineState = MachineState.returning;
  } else if (state == 0x15) {
    machineState = MachineState.paused;
  } else if (state == 0x20) {
    machineState = MachineState.positioning;
  } else if (state == 0x30) {
    machineState = MachineState.sleep;
  } else if (state == 0x31) {
    machineState = MachineState.exception;
  } else if (state == 0x00) {
    machineState = MachineState.shutdown;
  } else {
    machineState = MachineState.shutdown;
  }

  robotState = robotState.copyWith(machineState: machineState);

  return robotState;
}
