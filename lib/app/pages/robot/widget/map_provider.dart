import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'dart:ui';

import 'package:diagnosis_tool/app/di/logger_provider.dart';
import 'package:diagnosis_tool/data/helpers/map/map_data_handler.dart';
import 'package:diagnosis_tool/data/helpers/mqtt_entity_mapper.dart';
import 'package:diagnosis_tool/domain/entities/robot_map_entity.dart';
import 'package:diagnosis_tool/domain/entities/robot_status_entity.dart';
import 'package:diagnosis_tool/domain/observer.dart';
import 'package:diagnosis_tool/domain/usecases/robot_map_usecase.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

import '../robot_provider.dart';
import 'map_mode.dart';
import 'wall_painter.dart';

part 'map_provider.freezed.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    Image? map,
    Image? chargeImage,
    required List<int> chargePosition,
    Image? mowerImage,
    Position? mowerPosition,
    required double currentScale,
    required Offset dragViewOffset,
    required MapMode mapMode,
    List<WallData>? walls,
    WallData? currentWall,
  }) = _MapState;

  factory MapState.initial() => const MapState(
        map: null,
        chargeImage: null,
        chargePosition: [0, 0],
        mowerImage: null,
        mowerPosition: null,
        currentScale: 1.0,
        dragViewOffset: Offset.zero,
        mapMode: MapMode.normal,
        walls: [],
        currentWall: null,
      );
}

final mapProvider =
    StateNotifierProvider.autoDispose<MapStateNotifier, MapState>((ref) {
  return MapStateNotifier(ref.read(logger), ref.read(robotIdProvider));
});

class MapStateNotifier extends StateNotifier<MapState> {
  MapDataHandler mapDataHandler;
  Logger logger;
  String robotId;
  RobotMapUseCase robotMapUseCase;

  Function(RobotMapEntity? next)? onNext;
  Function? onComplete;
  Function? error;

  MapStateNotifier(this.logger, this.robotId)
      : mapDataHandler = MapDataHandler(logger),
        robotMapUseCase = RobotMapUseCase(logger),
        super(MapState.initial()) {
    robotMapUseCase.execute(
        _RobotMapUseCaseObserver(this), RobotMapUseCaseParams(robotId));
    // _loadMap();
    _listenMap();
    _listenPosition();
  }

  Future<void> _listenPosition() async {
    final chargeImage =
        await mapDataHandler.loadImage('assets/images/ic_charge.png', false);

    eventBus.on<Position>().listen((event) {
      logger.i(event);
      state = state.copyWith(mowerPosition: event, mowerImage: chargeImage);
    });
  }

  Future<void> _loadMap() async {
    ByteData mapData = await rootBundle.load('assets/mock/origin_slam_map.txt');
    final mapImage = await mapDataHandler.parseMapData(mapData);
    List<int> chargePosition = mapDataHandler.obtainChargePosition();
    final chargeImage =
        await mapDataHandler.loadImage('assets/images/ic_charge.png', false);

    state = state.copyWith(
        map: mapImage,
        chargeImage: chargeImage,
        chargePosition: chargePosition);
  }

  Future<void> _listenMap() async {
    onNext = (next) async {
      // 如果next为空，说明地图还未生成，不需要更新
      if (next == null || next.mapData == null) {
        logger.d('map data is null');
        return;
      }

      logger.i(next.mapStartPose);
      logger.i(next.width);
      logger.i(next.height);

      final mapImage = await mapDataHandler.parseIntListMapData(next.mapData!);
      List<int> chargePosition = mapDataHandler.obtainChargePosition();
      final chargeImage =
          await mapDataHandler.loadImage('assets/images/ic_charge.png', false);

      state = state.copyWith(
          map: mapImage,
          chargeImage: chargeImage,
          chargePosition: chargePosition);
    };
  }

  double _lastViewScale = 1.0;
  Offset? _lastViewPoint = const Offset(0, 0);

  void handleScaleStart(ScaleStartDetails details) {
    print('handleScaleStart localFocalPoint ${details.localFocalPoint}');
    _lastViewScale = state.currentScale;
    _lastViewPoint = details.localFocalPoint;
    if (state.mapMode == MapMode.normal) {
    } else {
      state = state.copyWith(
          currentWall: WallData(
              start: details.localFocalPoint / _lastViewScale -
                  state.dragViewOffset * _lastViewScale,
              end: details.localFocalPoint / _lastViewScale -
                  state.dragViewOffset * _lastViewScale,
              selected: true));
    }
  }

  void handleScaleUpdate(ScaleUpdateDetails details) {
    if (state.mapMode == MapMode.normal) {
      if (details.scale != 1) {
        ///缩放
        double tempScale = _lastViewScale * details.scale;

        /// 放大缩小的最大倍数
        if (tempScale > 13 || tempScale < 1) return;
        //缩放生效
        state = state.copyWith(currentScale: tempScale);
      } else {
        ///拖动
        Offset localFocalPoint = details.localFocalPoint;
        Offset tempPositionPoint = state.dragViewOffset +
            (localFocalPoint - (_lastViewPoint ?? Offset.zero));

        _lastViewPoint = localFocalPoint;

        state = state.copyWith(dragViewOffset: tempPositionPoint);
      }
    } else if (state.mapMode == MapMode.wall) {
      print('handleScaleUpdate handleScaleUpdate ${details.localFocalPoint}');
      // Offset localFocalPoint = details.localFocalPoint;
      // Offset tempPositionPoint = (state.currentWall?.end ?? Offset.zero) +
      //     (localFocalPoint - (_lastViewPoint ?? Offset.zero));
      //
      // _lastViewPoint = localFocalPoint;
      // state = state.copyWith(
      //     currentWall: state.currentWall?.copyWith(end: tempPositionPoint));

      print('state.dragViewOffset ${state.dragViewOffset}');
      state = state.copyWith(
          currentWall: state.currentWall?.copyWith(
              end: details.localFocalPoint / _lastViewScale -
                  state.dragViewOffset * _lastViewScale));
    }
  }

  void handleScaleEnd(ScaleEndDetails details) {
    print('handleScaleEnd ${details.velocity}');
    if (state.mapMode == MapMode.wall) {
      state = state.copyWith(
          walls: [...(state.walls ?? []), state.currentWall!],
          currentWall: null);
    }
  }

  void wallMode() {
    state = state.copyWith(mapMode: MapMode.wall);
  }

  void normalMode() {
    state = state.copyWith(mapMode: MapMode.normal);
  }
}

class _RobotMapUseCaseObserver extends Observer<RobotMapUseCaseResponse> {
  final MapStateNotifier presenter;

  _RobotMapUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    presenter.onComplete?.call();
  }

  @override
  void onError(e) {
    presenter.error?.call(e);
  }

  @override
  void onNext(response) {
    presenter.onNext?.call(response?.robotMap);
  }
}
