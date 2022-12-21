import 'dart:ui';

import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/app/pages/robot/robot_presenter.dart';
import 'package:diagnosis_tool/data/helpers/map/map_data_handler.dart';
import 'package:diagnosis_tool/data/repositories/data_robot_repository.dart';
import 'package:diagnosis_tool/domain/controller.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/src/logger.dart';

part 'robot_provider.freezed.dart';

@freezed
class RobotState with _$RobotState {
  const factory RobotState({
    required Image? image,
  }) = _RobotState;
}

final robotProvider =
    StateNotifierProvider.autoDispose<RobotStateNotifier, RobotState>(
        (ref) => RobotStateNotifier(DataRobotRepository(), ref.read(logger)));

class RobotStateNotifier extends Controller<RobotState> {
  RobotPresenter presenter;
  MapDataHandler mapData;
  Logger logger;

  RobotStateNotifier(repository, this.logger)
      : presenter = RobotPresenter(repository),
        mapData = MapDataHandler(logger),
        super(const RobotState(image: null)) {
    _loadMap();
  }

  @override
  void init() {
    presenter.onNext = (robot) {
      logger.i(robot.toString());
    };

    presenter.onComplete = () {
      logger.i('Robot retrieved');
    };

    presenter.onError = (e) {
      logger.i('Could not retrieve robot.');
    };
  }

  void _loadMap() {
    mapData
        .handleMapData(
            'info_map 0 230 192 505 490 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')
        .then((value) {
      logger.i('value $value');

      state = state.copyWith(image: value);
    });
  }

  @override
  void dispose() {
    super.dispose();
    presenter.dispose();
  }
}
