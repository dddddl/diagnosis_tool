// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'robot_map_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RobotMapEntity _$$_RobotMapEntityFromJson(Map<String, dynamic> json) =>
    _$_RobotMapEntity(
      mapStartPose: json['mapStartPose'] == null
          ? null
          : MapStartPose.fromJson(json['mapStartPose'] as Map<String, dynamic>),
      height: json['height'] as int?,
      width: json['width'] as int?,
      resolution: (json['resolution'] as num?)?.toDouble(),
      mapBuildSuccess: json['mapBuildSuccess'] as bool?,
      chargerPose: json['chargerPose'] == null
          ? null
          : ChargerPose.fromJson(json['chargerPose'] as Map<String, dynamic>),
      mapData:
          (json['mapData'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_RobotMapEntityToJson(_$_RobotMapEntity instance) =>
    <String, dynamic>{
      'mapStartPose': instance.mapStartPose,
      'height': instance.height,
      'width': instance.width,
      'resolution': instance.resolution,
      'mapBuildSuccess': instance.mapBuildSuccess,
      'chargerPose': instance.chargerPose,
      'mapData': instance.mapData,
    };

_$_ChargerPose _$$_ChargerPoseFromJson(Map<String, dynamic> json) =>
    _$_ChargerPose(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      yaw: (json['yaw'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ChargerPoseToJson(_$_ChargerPose instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'yaw': instance.yaw,
    };

_$_MapStartPose _$$_MapStartPoseFromJson(Map<String, dynamic> json) =>
    _$_MapStartPose(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      yaw: (json['yaw'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_MapStartPoseToJson(_$_MapStartPose instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'yaw': instance.yaw,
    };
