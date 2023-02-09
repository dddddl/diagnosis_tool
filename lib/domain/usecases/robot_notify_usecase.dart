import 'dart:async';
import 'dart:ffi';

import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/data/helpers/map/mqtt_entity_mapper.dart';
import 'package:diagnosis_tool/data/mqtt/mqtt_client.dart';
import 'package:diagnosis_tool/domain/entities/app_mqtt_connect_status.dart';
import 'package:diagnosis_tool/domain/entities/machine_state.dart';
import 'package:diagnosis_tool/domain/entities/robot.dart';
import 'package:diagnosis_tool/domain/entities/robot_status_entity.dart';
import 'package:diagnosis_tool/domain/repositories/robot_repository.dart';
import 'package:diagnosis_tool/domain/usecases.dart';
import 'package:event_bus/event_bus.dart';
import 'package:logger/logger.dart';

class RobotNotifyUseCase extends UseCase<RobotNotifyUseCaseResponse, Null> {
  Logger logger;

  RobotNotifyUseCase(this.logger) : super();

  @override
  Future<Stream<RobotNotifyUseCaseResponse?>> buildUseCaseStream(
      Null? params) async {
    return eventBus.on<RobotNotify>().map((event) {
      return RobotNotifyUseCaseResponse(event.notification);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class RobotNotifyUseCaseResponse {
  final String notification;

  RobotNotifyUseCaseResponse(this.notification);
}
