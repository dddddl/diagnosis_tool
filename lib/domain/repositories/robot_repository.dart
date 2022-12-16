import 'package:diagnosis_tool/domain/entities/robot.dart';

abstract class RobotRepository {
  Future<Robot> getRobot(String? uid);

  Future<List<Robot>> getAllRobots();
}
