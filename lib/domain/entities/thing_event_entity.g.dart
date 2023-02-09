// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thing_event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ThingEventEntity _$$_ThingEventEntityFromJson(Map<String, dynamic> json) =>
    _$_ThingEventEntity(
      cmd: json['cmd'] as int,
      uuid: json['uuid'] as String,
      eventId: json['eventId'] as String,
      eventType: json['eventType'] as String,
      timestamp: json['timestamp'] as int,
      param: json['param'],
    );

Map<String, dynamic> _$$_ThingEventEntityToJson(_$_ThingEventEntity instance) =>
    <String, dynamic>{
      'cmd': instance.cmd,
      'uuid': instance.uuid,
      'eventId': instance.eventId,
      'eventType': instance.eventType,
      'timestamp': instance.timestamp,
      'param': instance.param,
    };
