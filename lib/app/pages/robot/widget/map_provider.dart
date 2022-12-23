import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../robot_provider.dart';
import 'map_mode.dart';
import 'wall_painter.dart';

part 'map_provider.freezed.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    Image? image,
    required double currentScale,
    required Offset dragViewOffset,
    required MapMode mapMode,
    List<WallData>? walls,
    WallData? currentWall,
  }) = _MapState;
}

final mapProvider =
    StateNotifierProvider.autoDispose<MapStateNotifier, MapState>((ref) {
  return MapStateNotifier(ref);
});

class MapStateNotifier extends StateNotifier<MapState> {
  MapStateNotifier(_ref)
      : super(const MapState(
          image: null,
          currentScale: 1.0,
          dragViewOffset: Offset(0, 0),
          mapMode: MapMode.normal,
        )) {
    _ref.listen<Image?>(robotProvider.select((value) => value.image),
        (_, image) {
      double width = (image as Image).width.roundToDouble();
      double height = (image as Image).height.roundToDouble();

      state = state.copyWith(
        image: image,
        dragViewOffset: Offset(0, 0),
      );
    });
  }

  double _lastViewScale = 1.0;
  Offset? _lastViewPoint = Offset(0, 0);

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
              end: details.localFocalPoint/ _lastViewScale -
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
        if (tempScale > 2 || tempScale < 1) return;
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
              end: details.localFocalPoint/_lastViewScale - state.dragViewOffset * _lastViewScale));
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
