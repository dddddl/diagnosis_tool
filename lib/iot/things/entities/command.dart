import 'package:freezed_annotation/freezed_annotation.dart';

part 'command.freezed.dart';
part 'command.g.dart';

@Freezed(genericArgumentFactories: true)
class Command<T> with _$Command<T> {
  // int cmd = 3;
  // String uuid = ShortUuid.generateShortUuid();
  // int timeStamps = DateTime.now().millisecondsSinceEpoch;
  // T params;

  const factory Command({
    required int cmd,
    required String uuid,
    required int timeStamps,
    required T param,
  }) = _Command<T>;

  factory Command.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$CommandFromJson(json, fromJsonT);

}