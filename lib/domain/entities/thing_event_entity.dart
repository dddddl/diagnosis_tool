import 'package:freezed_annotation/freezed_annotation.dart';

part 'thing_event_entity.freezed.dart';

part 'thing_event_entity.g.dart';

@Freezed()
class ThingEventEntity with _$ThingEventEntity {

  const factory ThingEventEntity({
    required int cmd,
    required String uuid,
    required String eventId,
    required String eventType,
    required int timestamp,
    required dynamic param,
  }) = _ThingEventEntity;

  factory ThingEventEntity.fromJson(Map<String, dynamic> json) => _$ThingEventEntityFromJson(json);


}