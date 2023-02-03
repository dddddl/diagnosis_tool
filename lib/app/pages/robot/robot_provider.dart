import 'dart:ui';

import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/app/pages/robot/robot_presenter.dart';
import 'package:diagnosis_tool/data/helpers/map/map_data_handler.dart';
import 'package:diagnosis_tool/data/helpers/mqtt_entity_mapper.dart';
import 'package:diagnosis_tool/data/repositories/data_robot_repository.dart';
import 'package:diagnosis_tool/domain/controller.dart';
import 'package:diagnosis_tool/domain/entities/app_mqtt_connect_status.dart';
import 'package:diagnosis_tool/domain/entities/robot_status_entity.dart';
import 'package:flutter/services.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/src/logger.dart';

part 'robot_provider.freezed.dart';

@freezed
class RobotViewState with _$RobotViewState {
  const factory RobotViewState({
    required RobotState robotState,
    @Default(false) bool mqttConnected,
  }) = _RobotViewState;

  factory RobotViewState.initial() => RobotViewState(
        robotState: RobotState.initial(),
      );
}

final robotIdProvider = StateProvider.autoDispose<String>((ref) => '');

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
        super(RobotViewState.initial());

  void listenRobotState(String mac) {
    presenter.getRobotState(mac);
  }

  @override
  void init() {
    presenter.onNext = (next) {
      if (next is RobotState) {
        state = state.copyWith(robotState: next);
      } else if (next is AppMqttConnectStatus) {
        state = state.copyWith(mqttConnected: next.connect);
      }
    };

    presenter.onComplete = () {
      logger.i('Robot retrieved');
    };

    presenter.onError = (e) {
      logger.i('Could not retrieve robot.');
    };
  }

  @override
  void dispose() {
    super.dispose();
    presenter.dispose();
  }

  charge(bool charging) {
    if (charging) {
      pause();
    } else {
      presenter.charge();
    }
  }

  mower(bool mowing) {
    if (mowing) {
      pause();
    } else {
      presenter.mower();
    }
  }

  map(bool mapping) {
    if (mapping) {
      pause();
    } else {
      presenter.map();
    }
  }

  pause() {
    presenter.pause();
  }
}
