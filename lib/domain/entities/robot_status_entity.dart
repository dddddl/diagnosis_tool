import 'package:diagnosis_tool/data/helpers/map/mqtt_entity_mapper.dart';
import 'package:diagnosis_tool/domain/entities/machine_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'robot_status_entity.freezed.dart';

part 'robot_status_entity.g.dart';

@freezed
class RobotState with _$RobotState {
  const factory RobotState({
    String? name,
    int? state,
    MachineState? machineState,
    int? power,
    double? timestamp,
    double? acreage,
    int? duration,
    double? moveSpeed,
    double? motorRotateSpeed,
    Position? path,
    required List<Position> position,
  }) = _RobotState;

  factory RobotState.fromJson(Map<String, dynamic> json) =>
      _$RobotStateFromJson(json);

  factory RobotState.initial() => const RobotState(
        name: null,
        state: null,
        power: null,
        timestamp: null,
        acreage: null,
        duration: null,
        moveSpeed: null,
        motorRotateSpeed: null,
        position: [],
        path: null,
      );
}

@freezed
class Position with _$Position {
  const factory Position({
    double? x,
    double? y,
    double? z,
    double? w,
  }) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}
