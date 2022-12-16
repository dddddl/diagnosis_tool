import 'dart:async';

import 'package:diagnosis_tool/domain/entities/robot.dart';
import 'package:diagnosis_tool/domain/repositories/robot_repository.dart';
import 'package:diagnosis_tool/domain/usecases.dart';

class RobotUseCase extends UseCase<RobotUseCaseResponse, RobotUseCaseParams> {
  RobotRepository robotRepository;

  RobotUseCase(this.robotRepository);

  @override
  Future<Stream<RobotUseCaseResponse>> buildUseCaseStream(
      RobotUseCaseParams? params) async {
    final controller = StreamController<RobotUseCaseResponse>();
    try {
      // get user
      final robot = await robotRepository.getRobot(params?.robotId);
      // Adding it triggers the .onNext() in the `Observer`
      // It is usually better to wrap the reponse inside a respose object.
      controller.add(RobotUseCaseResponse(robot));
      // logger.finest('GetUserUseCase successful.');
      controller.close();
    } catch (e) {
      // logger.severe('GetUserUseCase unsuccessful.');
      // Trigger .onError
      controller.addError(e);
    }
    return controller.stream;
  }
}

class RobotUseCaseParams {
  String robotId;

  RobotUseCaseParams(this.robotId);
}

class RobotUseCaseResponse {
  final Robot robot;

  RobotUseCaseResponse(this.robot);
}
