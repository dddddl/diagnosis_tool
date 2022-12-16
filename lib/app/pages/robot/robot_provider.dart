import 'package:diagnosis_tool/app/pages/robot/robot_presenter.dart';
import 'package:diagnosis_tool/data/repositories/data_robot_repository.dart';
import 'package:diagnosis_tool/domain/controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final robotProvider =
    StateNotifierProvider.autoDispose<RobotStateNotifier, RobotState>(
        (ref) => RobotStateNotifier(DataRobotRepository()));

class RobotStateNotifier extends Controller<RobotState> {
  RobotPresenter presenter;

  RobotStateNotifier(repository)
      : presenter = RobotPresenter(repository),
        super(RobotState());

  @override
  void init() {
    presenter.onNext = (robot) {
      print(robot.toString());
    };

    presenter.onComplete = () {
      print('Robot retrieved');
    };

    presenter.onError = (e) {
      print('Could not retrieve robot.');
    };
  }

  @override
  void dispose() {
    super.dispose();
    presenter.dispose();
  }
}

class RobotState {}
