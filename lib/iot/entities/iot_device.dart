import 'package:freezed_annotation/freezed_annotation.dart';


part 'iot_device.freezed.dart';

part 'iot_device.g.dart';

@freezed
class IotDevice with _$IotDevice {
  const factory IotDevice({
    String? userId,
    String? deviceId,
    String? nickname,
    double? role,
    String? environment,
    String? ownerId,
    String? mac,
    String? productId,
    double? isOnline,
  }) = _IotDevice;

  factory IotDevice.fromJson(Map<String, dynamic> json) => _$IotDeviceFromJson(json);
}
