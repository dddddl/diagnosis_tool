import 'package:freezed_annotation/freezed_annotation.dart';

part 'robot_map_entity.freezed.dart';

part 'robot_map_entity.g.dart';

@freezed
class RobotMapEntity with _$RobotMapEntity {
  const factory RobotMapEntity({
    MapStartPose? mapStartPose,
    int? height,
    int? width,
    double? resolution,
    bool? mapBuildSuccess,
    ChargerPose? chargerPose,
    List<int>? mapData,
  }) = _RobotMapEntity;

  factory RobotMapEntity.fromJson(Map<String, dynamic> json) =>
      _$RobotMapEntityFromJson(json);
}

@freezed
class ChargerPose with _$ChargerPose {

  const factory ChargerPose({
    double? x,
    double? y,
    double? yaw,
  }) = _ChargerPose;

  factory ChargerPose.fromJson(Map<String, dynamic> json) =>
      _$ChargerPoseFromJson(json);
}

@freezed
class MapStartPose with _$MapStartPose {
  const factory MapStartPose({
    double? x,
    double? y,
    double? yaw,
  }) = _MapStartPose;

  factory MapStartPose.fromJson(Map<String, dynamic> json) =>
      _$MapStartPoseFromJson(json);
}
