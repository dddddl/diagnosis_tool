// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transport_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransportState _$$_TransportStateFromJson(Map<String, dynamic> json) =>
    _$_TransportState(
      ssid: json['ssid'] as String?,
      password: json['password'] as String?,
      progress: json['progress'] as int?,
      isFailed: json['isFailed'] as bool?,
      isSuccess: json['isSuccess'] as bool?,
    );

Map<String, dynamic> _$$_TransportStateToJson(_$_TransportState instance) =>
    <String, dynamic>{
      'ssid': instance.ssid,
      'password': instance.password,
      'progress': instance.progress,
      'isFailed': instance.isFailed,
      'isSuccess': instance.isSuccess,
    };
