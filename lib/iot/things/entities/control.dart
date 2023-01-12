import 'package:diagnosis_tool/iot/utils/short_uuid.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'control.freezed.dart';

part 'control.g.dart';


@freezed
class ControlParams with _$ControlParams {
  // int status;
  // int velocity;

  const factory ControlParams({
    required int status,
  }) = _ControlParams;

  factory ControlParams.fromJson(Map<String, dynamic> json) =>
      _$ControlParamsFromJson(json);

}

