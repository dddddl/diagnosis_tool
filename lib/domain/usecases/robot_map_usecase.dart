import 'dart:async';

import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/data/helpers/map/mqtt_entity_mapper.dart';
import 'package:diagnosis_tool/data/mqtt/mqtt_client.dart';
import 'package:diagnosis_tool/domain/entities/machine_state.dart';
import 'package:diagnosis_tool/domain/entities/robot.dart';
import 'package:diagnosis_tool/domain/entities/robot_map_entity.dart';
import 'package:diagnosis_tool/domain/entities/robot_status_entity.dart';
import 'package:diagnosis_tool/domain/repositories/robot_repository.dart';
import 'package:diagnosis_tool/domain/usecases.dart';
import 'package:event_bus/event_bus.dart';
import 'package:logger/logger.dart';

class RobotMapUseCase extends UseCase<RobotMapUseCaseResponse, RobotMapUseCaseParams> {
  Logger logger;

  RobotMapUseCase( this.logger) : super();

  @override
  Future<Stream<RobotMapUseCaseResponse?>> buildUseCaseStream(
      RobotMapUseCaseParams? params) async {
    return eventBus.on<RobotMapEntity>().map((event) {
      return RobotMapUseCaseResponse(event);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class RobotMapUseCaseParams {
  String robotId;

  RobotMapUseCaseParams(this.robotId);
}

class RobotMapUseCaseResponse {
  final RobotMapEntity robotMap;

  RobotMapUseCaseResponse(this.robotMap);
}
