import 'package:diagnosis_tool/domain/entities/robot.dart';
import 'package:diagnosis_tool/domain/repositories/robot_repository.dart';

class DataRobotRepository extends RobotRepository {
  @override
  Future<List<Robot>> getAllRobots() {
    return Future(() => []);
  }

  @override
  Future<Robot> getRobot(String? uid) {
    return Future.value(Robot());
  }
}
