// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'robot_status_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RobotState _$$_RobotStateFromJson(Map<String, dynamic> json) =>
    _$_RobotState(
      name: json['name'] as String?,
      state: json['state'] as int?,
      machineState:
          $enumDecodeNullable(_$MachineStateEnumMap, json['machineState']),
      power: json['power'] as int?,
      timestamp: (json['timestamp'] as num?)?.toDouble(),
      acreage: (json['acreage'] as num?)?.toDouble(),
      duration: json['duration'] as int?,
      moveSpeed: (json['moveSpeed'] as num?)?.toDouble(),
      motorRotateSpeed: (json['motorRotateSpeed'] as num?)?.toDouble(),
      position: json['position'] == null
          ? null
          : Position.fromJson(json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RobotStateToJson(_$_RobotState instance) =>
    <String, dynamic>{
      'name': instance.name,
      'state': instance.state,
      'machineState': _$MachineStateEnumMap[instance.machineState],
      'power': instance.power,
      'timestamp': instance.timestamp,
      'acreage': instance.acreage,
      'duration': instance.duration,
      'moveSpeed': instance.moveSpeed,
      'motorRotateSpeed': instance.motorRotateSpeed,
      'position': instance.position,
    };

const _$MachineStateEnumMap = {
  MachineState.locked: 'locked',
  MachineState.standby: 'standby',
  MachineState.mapping: 'mapping',
  MachineState.mowing: 'mowing',
  MachineState.returning: 'returning',
  MachineState.paused: 'paused',
  MachineState.positioning: 'positioning',
  MachineState.sleep: 'sleep',
  MachineState.exception: 'exception',
  MachineState.shutdown: 'shutdown',
  MachineState.other: 'other',
};

_$_Position _$$_PositionFromJson(Map<String, dynamic> json) => _$_Position(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      z: (json['z'] as num?)?.toDouble(),
      w: (json['w'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_PositionToJson(_$_Position instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'z': instance.z,
      'w': instance.w,
    };
