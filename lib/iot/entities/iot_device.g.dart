// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iot_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IotDevice _$$_IotDeviceFromJson(Map<String, dynamic> json) => _$_IotDevice(
      userId: json['userId'] as String?,
      deviceId: json['deviceId'] as String?,
      nickname: json['nickname'] as String?,
      role: (json['role'] as num?)?.toDouble(),
      environment: json['environment'] as String?,
      ownerId: json['ownerId'] as String?,
      mac: json['mac'] as String?,
      productId: json['productId'] as String?,
      isOnline: (json['isOnline'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_IotDeviceToJson(_$_IotDevice instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'deviceId': instance.deviceId,
      'nickname': instance.nickname,
      'role': instance.role,
      'environment': instance.environment,
      'ownerId': instance.ownerId,
      'mac': instance.mac,
      'productId': instance.productId,
      'isOnline': instance.isOnline,
    };
