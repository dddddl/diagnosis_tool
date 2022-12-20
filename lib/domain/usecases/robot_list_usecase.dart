import 'dart:async';

import 'package:diagnosis_tool/domain/entities/robot.dart';
import 'package:diagnosis_tool/domain/repositories/robot_repository.dart';
import 'package:diagnosis_tool/domain/usecases.dart';

class RobotListUseCase
    extends UseCase<RobotListUseCaseResponse, RobotListUseCaseParams> {
  RobotRepository robotRepository;

  RobotListUseCase(this.robotRepository);

  @override
  Future<Stream<RobotListUseCaseResponse?>> buildUseCaseStream(
      RobotListUseCaseParams? params) async {
    final controller = StreamController<RobotListUseCaseResponse>();
    try {
      final robot = await robotRepository.getAllRobots();

      controller.add(RobotListUseCaseResponse(robot));

      controller.close();
    } catch (e) {
      controller.addError(e);
    }
    return controller.stream;
  }
}

class RobotListUseCaseParams {}

class RobotListUseCaseResponse {
  final List<Robot> robots;

  RobotListUseCaseResponse(this.robots);
}
