// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thing_cmd_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ThingCmdEntity _$$_ThingCmdEntityFromJson(Map<String, dynamic> json) =>
    _$_ThingCmdEntity(
      cmd: json['cmd'] as int,
      uuid: json['uuid'] as String,
      code: json['code'] as int,
      data: json['data'],
    );

Map<String, dynamic> _$$_ThingCmdEntityToJson(_$_ThingCmdEntity instance) =>
    <String, dynamic>{
      'cmd': instance.cmd,
      'uuid': instance.uuid,
      'code': instance.code,
      'data': instance.data,
    };
