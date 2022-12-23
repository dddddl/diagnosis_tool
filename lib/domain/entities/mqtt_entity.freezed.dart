// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mqtt_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MqttEntity _$MqttEntityFromJson(Map<String, dynamic> json) {
  return _MqttEntity.fromJson(json);
}

/// @nodoc
mixin _$MqttEntity {
  String get cmd => throw _privateConstructorUsedError;
  String get subcmd => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MqttEntityCopyWith<MqttEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MqttEntityCopyWith<$Res> {
  factory $MqttEntityCopyWith(
          MqttEntity value, $Res Function(MqttEntity) then) =
      _$MqttEntityCopyWithImpl<$Res, MqttEntity>;
  @useResult
  $Res call({String cmd, String subcmd, String uuid, dynamic data});
}

/// @nodoc
class _$MqttEntityCopyWithImpl<$Res, $Val extends MqttEntity>
    implements $MqttEntityCopyWith<$Res> {
  _$MqttEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cmd = null,
    Object? subcmd = null,
    Object? uuid = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      cmd: null == cmd
          ? _value.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as String,
      subcmd: null == subcmd
          ? _value.subcmd
          : subcmd // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MqttEntityCopyWith<$Res>
    implements $MqttEntityCopyWith<$Res> {
  factory _$$_MqttEntityCopyWith(
          _$_MqttEntity value, $Res Function(_$_MqttEntity) then) =
      __$$_MqttEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cmd, String subcmd, String uuid, dynamic data});
}

/// @nodoc
class __$$_MqttEntityCopyWithImpl<$Res>
    extends _$MqttEntityCopyWithImpl<$Res, _$_MqttEntity>
    implements _$$_MqttEntityCopyWith<$Res> {
  __$$_MqttEntityCopyWithImpl(
      _$_MqttEntity _value, $Res Function(_$_MqttEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cmd = null,
    Object? subcmd = null,
    Object? uuid = null,
    Object? data = freezed,
  }) {
    return _then(_$_MqttEntity(
      cmd: null == cmd
          ? _value.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as String,
      subcmd: null == subcmd
          ? _value.subcmd
          : subcmd // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MqttEntity implements _MqttEntity {
  const _$_MqttEntity(
      {required this.cmd,
      required this.subcmd,
      required this.uuid,
      required this.data});

  factory _$_MqttEntity.fromJson(Map<String, dynamic> json) =>
      _$$_MqttEntityFromJson(json);

  @override
  final String cmd;
  @override
  final String subcmd;
  @override
  final String uuid;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'MqttEntity(cmd: $cmd, subcmd: $subcmd, uuid: $uuid, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MqttEntity &&
            (identical(other.cmd, cmd) || other.cmd == cmd) &&
            (identical(other.subcmd, subcmd) || other.subcmd == subcmd) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cmd, subcmd, uuid,
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MqttEntityCopyWith<_$_MqttEntity> get copyWith =>
      __$$_MqttEntityCopyWithImpl<_$_MqttEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MqttEntityToJson(
      this,
    );
  }
}

abstract class _MqttEntity implements MqttEntity {
  const factory _MqttEntity(
      {required final String cmd,
      required final String subcmd,
      required final String uuid,
      required final dynamic data}) = _$_MqttEntity;

  factory _MqttEntity.fromJson(Map<String, dynamic> json) =
      _$_MqttEntity.fromJson;

  @override
  String get cmd;
  @override
  String get subcmd;
  @override
  String get uuid;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$_MqttEntityCopyWith<_$_MqttEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
