import 'package:freezed_annotation/freezed_annotation.dart';

part 'thing_cmd_entity.freezed.dart';

part 'thing_cmd_entity.g.dart';

@Freezed()
class ThingCmdEntity with _$ThingCmdEntity {

  const factory ThingCmdEntity({
    required int cmd,
    required String uuid,
    required int code,
    required dynamic data,
  }) = _ThingCmdEntity;

  factory ThingCmdEntity.fromJson(Map<String, dynamic> json) =>
      _$ThingCmdEntityFromJson(json);

}
