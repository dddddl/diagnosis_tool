import 'dart:ui';

import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/app/pages/robot/robot_presenter.dart';
import 'package:diagnosis_tool/data/helpers/map/map_data_handler.dart';
import 'package:diagnosis_tool/data/repositories/data_robot_repository.dart';
import 'package:diagnosis_tool/domain/controller.dart';
import 'package:diagnosis_tool/domain/entities/robot_map.dart';
import 'package:flutter/services.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/src/logger.dart';

part 'robot_provider.freezed.dart';

@freezed
class RobotViewState with _$RobotViewState {
  const factory RobotViewState({
    required Image? image,
    required RobotState robotState,
  }) = _RobotViewState;

  factory RobotViewState.initial() =>
      RobotViewState(
        image: null,
        robotState: RobotState.initial(),
      );
}

final robotProvider =
StateNotifierProvider.autoDispose<RobotStateNotifier, RobotViewState>(
        (ref) => RobotStateNotifier(DataRobotRepository(), ref.read(logger)));

class RobotStateNotifier extends Controller<RobotViewState> {
  RobotPresenter presenter;
  MapDataHandler mapDataHandler;
  Logger logger;

  RobotStateNotifier(repository, this.logger)
      : presenter = RobotPresenter(repository, logger),
        mapDataHandler = MapDataHandler(logger),
        super(RobotViewState.initial()) {
    _loadMap();
  }

  void listenRobotState(String mac) {
    presenter.getRobotState(mac);
  }

  @override
  void init() {
    presenter.onNext = (robotState) {
      state = state.copyWith(robotState: robotState);
      logger.i(robotState.toString());
    };

    presenter.onComplete = () {
      logger.i('Robot retrieved');
    };

    presenter.onError = (e) {
      logger.i('Could not retrieve robot.');
    };
  }


  Future<void> _loadMap() async {
    ByteData mapData = await rootBundle.load('assets/mock/origin_slam_map.txt');

    mapDataHandler
        .parseMapData(mapData)
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
