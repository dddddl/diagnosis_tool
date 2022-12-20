import 'package:diagnosis_tool/data/constants.dart';
import 'package:diagnosis_tool/domain/entities/robot.dart';
import 'package:diagnosis_tool/domain/repositories/robot_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataRobotRepository extends RobotRepository {
  @override
  Future<List<Robot>> getAllRobots() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? localRobots = prefs.getStringList(Constants.localRobots);
    localRobots ??= [];
    return localRobots.map((e) => Robot(mac: e)).toList();
  }

  @override
  Future<Robot> getRobot(String? uid) {
    return Future.value(Robot(mac: uid));
  }
}
