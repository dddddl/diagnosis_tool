// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Command<T> _$$_CommandFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_Command<T>(
      cmd: json['cmd'] as int,
      uuid: json['uuid'] as String,
      timeStamps: json['timeStamps'] as int,
      param: fromJsonT(json['param']),
    );

Map<String, dynamic> _$$_CommandToJson<T>(
  _$_Command<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'cmd': instance.cmd,
      'uuid': instance.uuid,
      'timeStamps': instance.timeStamps,
      'param': toJsonT(instance.param),
    };
