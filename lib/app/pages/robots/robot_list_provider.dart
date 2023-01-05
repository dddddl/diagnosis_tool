import 'package:diagnosis_tool/data/constants.dart';
import 'package:diagnosis_tool/data/repositories/data_robot_repository.dart';
import 'package:diagnosis_tool/domain/controller.dart';
import 'package:diagnosis_tool/domain/entities/robot.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'robot_list_presenter.dart';

part 'robot_list_provider.freezed.dart';

@freezed
class RobotListState with _$RobotListState {
  factory RobotListState({
    List<Robot>? robots,
  }) = _RobotListState;
}

final robotListProvider =
    StateNotifierProvider<RobotListProvider, RobotListState>((ref) {
  return RobotListProvider(DataRobotRepository());
});

class RobotListProvider extends Controller<RobotListState> {
  RobotListPresenter presenter;

  RobotListProvider(dataRobotRepository)
      : presenter = RobotListPresenter(dataRobotRepository),
        super(RobotListState()) {
    getRobots();
  }

  @override
  void init() {
    String result = 'b8:d6:1a:a0:19:c8';
    SharedPreferences.getInstance().then((prefs) {
      List<String>? localRobots = prefs.getStringList(Constants.localRobots);
      localRobots ??= [];
      if (!localRobots.contains(result)) {
        localRobots.add(result);
      } else {
        localRobots.remove(result);
        localRobots.add(result);
      }

      prefs.setStringList(Constants.localRobots, localRobots);
    });

    presenter.onNext = (List<Robot>? robots) {
      state = state.copyWith(robots: robots);
    };
  }

  void getRobots() {
    presenter.getAll();
  }

  @override
  void dispose() {
    super.dispose();
    presenter.dispose();
  }
}
