import 'package:diagnosis_tool/domain/entities/machine_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'robot_map.freezed.dart';

part 'robot_map.g.dart';

@freezed
class RobotState with _$RobotState {
  const factory RobotState({
    String? name,
    MachineState? state,
    int? power,
    int? timestamp,
    double? acreage,
    int? duration,
    double? moveSpeed,
    int? motorRotateSpeed,
    Position? position,
  }) = _RobotState;

  factory RobotState.fromJson(Map<String, dynamic> json) =>
      _$RobotStateFromJson(json);
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
