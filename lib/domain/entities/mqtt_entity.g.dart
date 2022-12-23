// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqtt_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MqttEntity _$$_MqttEntityFromJson(Map<String, dynamic> json) =>
    _$_MqttEntity(
      cmd: json['cmd'] as String,
      subcmd: json['subcmd'] as String,
      uuid: json['uuid'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$$_MqttEntityToJson(_$_MqttEntity instance) =>
    <String, dynamic>{
      'cmd': instance.cmd,
      'subcmd': instance.subcmd,
      'uuid': instance.uuid,
      'data': instance.data,
    };
