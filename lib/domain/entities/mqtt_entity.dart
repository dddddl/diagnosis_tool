import 'package:freezed_annotation/freezed_annotation.dart';

part 'mqtt_entity.freezed.dart';

part 'mqtt_entity.g.dart';

// @Freezed(genericArgumentFactories: true)
// class MqttEntity<T> with _$MqttEntity<T> {
//   // String cmd;
//   // String subcmd;
//   // String uuid;
//   // T data;
//
//   const factory MqttEntity({
//     required String cmd,
//     required String subcmd,
//     required String uuid,
//     required T data,
//   }) = _MqttEntity<T>;
//
//   factory MqttEntity.fromJson(Map<String, dynamic> json,
//       T Function(Object?) fromJsonT) =>
//       _$MqttEntityFromJson(json, fromJsonT);
//
// }

@Freezed()
class MqttEntity with _$MqttEntity {
  // String cmd;
  // String subcmd;
  // String uuid;
  //  dynamic data;

  const factory MqttEntity({
    required String cmd,
    required String subcmd,
    required String uuid,
    required dynamic data,
  }) = _MqttEntity;

  factory MqttEntity.fromJson(Map<String, dynamic> json) =>
      _$MqttEntityFromJson(json);
}
