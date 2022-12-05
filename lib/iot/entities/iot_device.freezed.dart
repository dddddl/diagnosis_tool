// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iot_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IotDevice _$IotDeviceFromJson(Map<String, dynamic> json) {
  return _IotDevice.fromJson(json);
}

/// @nodoc
mixin _$IotDevice {
  String? get userId => throw _privateConstructorUsedError;
  String? get deviceId => throw _privateConstructorUsedError;
  String? get nickname => throw _privateConstructorUsedError;
  double? get role => throw _privateConstructorUsedError;
  String? get environment => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  String? get mac => throw _privateConstructorUsedError;
  String? get productId => throw _privateConstructorUsedError;
  double? get isOnline => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IotDeviceCopyWith<IotDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IotDeviceCopyWith<$Res> {
  factory $IotDeviceCopyWith(IotDevice value, $Res Function(IotDevice) then) =
      _$IotDeviceCopyWithImpl<$Res, IotDevice>;
  @useResult
  $Res call(
      {String? userId,
      String? deviceId,
      String? nickname,
      double? role,
      String? environment,
      String? ownerId,
      String? mac,
      String? productId,
      double? isOnline});
}

/// @nodoc
class _$IotDeviceCopyWithImpl<$Res, $Val extends IotDevice>
    implements $IotDeviceCopyWith<$Res> {
  _$IotDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? deviceId = freezed,
    Object? nickname = freezed,
    Object? role = freezed,
    Object? environment = freezed,
    Object? ownerId = freezed,
    Object? mac = freezed,
    Object? productId = freezed,
    Object? isOnline = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as double?,
      environment: freezed == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      mac: freezed == mac
          ? _value.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IotDeviceCopyWith<$Res> implements $IotDeviceCopyWith<$Res> {
  factory _$$_IotDeviceCopyWith(
          _$_IotDevice value, $Res Function(_$_IotDevice) then) =
      __$$_IotDeviceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userId,
      String? deviceId,
      String? nickname,
      double? role,
      String? environment,
      String? ownerId,
      String? mac,
      String? productId,
      double? isOnline});
}

/// @nodoc
class __$$_IotDeviceCopyWithImpl<$Res>
    extends _$IotDeviceCopyWithImpl<$Res, _$_IotDevice>
    implements _$$_IotDeviceCopyWith<$Res> {
  __$$_IotDeviceCopyWithImpl(
      _$_IotDevice _value, $Res Function(_$_IotDevice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? deviceId = freezed,
    Object? nickname = freezed,
    Object? role = freezed,
    Object? environment = freezed,
    Object? ownerId = freezed,
    Object? mac = freezed,
    Object? productId = freezed,
    Object? isOnline = freezed,
  }) {
    return _then(_$_IotDevice(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      nickname: freezed == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as double?,
      environment: freezed == environment
          ? _value.environment
          : environment // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      mac: freezed == mac
          ? _value.mac
          : mac // ignore: cast_nullable_to_non_nullable
              as String?,
      productId: freezed == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_IotDevice implements _IotDevice {
  const _$_IotDevice(
      {this.userId,
      this.deviceId,
      this.nickname,
      this.role,
      this.environment,
      this.ownerId,
      this.mac,
      this.productId,
      this.isOnline});

  factory _$_IotDevice.fromJson(Map<String, dynamic> json) =>
      _$$_IotDeviceFromJson(json);

  @override
  final String? userId;
  @override
  final String? deviceId;
  @override
  final String? nickname;
  @override
  final double? role;
  @override
  final String? environment;
  @override
  final String? ownerId;
  @override
  final String? mac;
  @override
  final String? productId;
  @override
  final double? isOnline;

  @override
  String toString() {
    return 'IotDevice(userId: $userId, deviceId: $deviceId, nickname: $nickname, role: $role, environment: $environment, ownerId: $ownerId, mac: $mac, productId: $productId, isOnline: $isOnline)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IotDevice &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.environment, environment) ||
                other.environment == environment) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.mac, mac) || other.mac == mac) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, deviceId, nickname, role,
      environment, ownerId, mac, productId, isOnline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IotDeviceCopyWith<_$_IotDevice> get copyWith =>
      __$$_IotDeviceCopyWithImpl<_$_IotDevice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IotDeviceToJson(
      this,
    );
  }
}

abstract class _IotDevice implements IotDevice {
  const factory _IotDevice(
      {final String? userId,
      final String? deviceId,
      final String? nickname,
      final double? role,
      final String? environment,
      final String? ownerId,
      final String? mac,
      final String? productId,
      final double? isOnline}) = _$_IotDevice;

  factory _IotDevice.fromJson(Map<String, dynamic> json) =
      _$_IotDevice.fromJson;

  @override
  String? get userId;
  @override
  String? get deviceId;
  @override
  String? get nickname;
  @override
  double? get role;
  @override
  String? get environment;
  @override
  String? get ownerId;
  @override
  String? get mac;
  @override
  String? get productId;
  @override
  double? get isOnline;
  @override
  @JsonKey(ignore: true)
  _$$_IotDeviceCopyWith<_$_IotDevice> get copyWith =>
      throw _privateConstructorUsedError;
}
