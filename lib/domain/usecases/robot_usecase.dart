import 'dart:async';

import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/data/helpers/mqtt_entity_mapper.dart';
import 'package:diagnosis_tool/data/mqtt/mqtt_client.dart';
import 'package:diagnosis_tool/domain/entities/machine_state.dart';
import 'package:diagnosis_tool/domain/entities/robot.dart';
import 'package:diagnosis_tool/domain/entities/robot_map.dart';
import 'package:diagnosis_tool/domain/repositories/robot_repository.dart';
import 'package:diagnosis_tool/domain/usecases.dart';
import 'package:event_bus/event_bus.dart';
import 'package:logger/logger.dart';

class RobotUseCase extends UseCase<RobotUseCaseResponse, RobotUseCaseParams> {
  RobotRepository robotRepository;
  Logger logger;

  RobotUseCase(this.robotRepository, this.logger) : super();

  @override
  Future<Stream<RobotUseCaseResponse?>> buildUseCaseStream(
      RobotUseCaseParams? params) async {
    return eventBus.on<RobotState>().map((event) {
      event =
          event.copyWith(machineState: MachineState.values[event.machineState]);
      return RobotUseCaseResponse(event);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class RobotUseCaseParams {
  String robotId;

  RobotUseCaseParams(this.robotId);
}

class RobotUseCaseResponse {
  final RobotState robotState;

  RobotUseCaseResponse(this.robotState);
}
