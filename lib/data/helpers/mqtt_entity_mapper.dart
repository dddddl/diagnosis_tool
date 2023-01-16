import 'dart:convert';

import 'package:diagnosis_tool/domain/entities/machine_state.dart';
import 'package:diagnosis_tool/domain/entities/mqtt_entity.dart';
import 'package:diagnosis_tool/domain/entities/robot_map_entity.dart';
import 'package:diagnosis_tool/domain/entities/robot_status_entity.dart';
import 'package:diagnosis_tool/domain/entities/thing_cmd_entity.dart';
import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

void mapMqttEntityToCmd(MqttEntity mqttEntity) {
  if (mqttEntity.cmd == "data") {
    RobotState robotState = RobotState.fromJson(mqttEntity.data);
    eventBus.fire(mapRobotStateToMachine(robotState));
    eventBus.fire(robotState.position);
    eventBus.fire(robotState.path);
  } else if (mqttEntity.cmd == "map") {
    RobotMapEntity robotState = RobotMapEntity.fromJson(mqttEntity.data);
    eventBus.fire(robotState);
  } else {
    print("Unknown cmd");
  }
}

void mapThingCmdEntityToCmd(ThingCmdEntity thingCmdEntity) {
  print("thingCmdEntity: ${thingCmdEntity.toJson()}");
}

RobotState mapRobotStateToMachine(RobotState robotState) {
  final state = robotState.state ?? 0;

  MachineState machineState;

  if (state == 0) {
    machineState = MachineState.locked;
  } else if (state == 1) {
    machineState = MachineState.standby;
  } else if (state == 2) {
    machineState = MachineState.mapping;
  } else if (state == 3) {
    machineState = MachineState.mowing;
  } else if (state == 4) {
    machineState = MachineState.returning;
  } else if (state == 5) {
    machineState = MachineState.paused;
  } else if (state == 6) {
    machineState = MachineState.positioning;
  } else if (state == 7) {
    machineState = MachineState.sleep;
  } else if (state == 8) {
    machineState = MachineState.exception;
  } else if (state == 9) {
    machineState = MachineState.shutdown;
  } else if (state == 10) {
    machineState = MachineState.emergency_stop;
  } else {
    machineState = MachineState.shutdown;
  }

  robotState = robotState.copyWith(machineState: machineState);

  return robotState;
}
