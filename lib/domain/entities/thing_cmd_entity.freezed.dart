// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thing_cmd_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThingCmdEntity _$ThingCmdEntityFromJson(Map<String, dynamic> json) {
  return _ThingCmdEntity.fromJson(json);
}

/// @nodoc
mixin _$ThingCmdEntity {
  int get cmd => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThingCmdEntityCopyWith<ThingCmdEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThingCmdEntityCopyWith<$Res> {
  factory $ThingCmdEntityCopyWith(
          ThingCmdEntity value, $Res Function(ThingCmdEntity) then) =
      _$ThingCmdEntityCopyWithImpl<$Res, ThingCmdEntity>;
  @useResult
  $Res call({int cmd, String uuid, int code, dynamic data});
}

/// @nodoc
class _$ThingCmdEntityCopyWithImpl<$Res, $Val extends ThingCmdEntity>
    implements $ThingCmdEntityCopyWith<$Res> {
  _$ThingCmdEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cmd = null,
    Object? uuid = null,
    Object? code = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      cmd: null == cmd
          ? _value.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ThingCmdEntityCopyWith<$Res>
    implements $ThingCmdEntityCopyWith<$Res> {
  factory _$$_ThingCmdEntityCopyWith(
          _$_ThingCmdEntity value, $Res Function(_$_ThingCmdEntity) then) =
      __$$_ThingCmdEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int cmd, String uuid, int code, dynamic data});
}

/// @nodoc
class __$$_ThingCmdEntityCopyWithImpl<$Res>
    extends _$ThingCmdEntityCopyWithImpl<$Res, _$_ThingCmdEntity>
    implements _$$_ThingCmdEntityCopyWith<$Res> {
  __$$_ThingCmdEntityCopyWithImpl(
      _$_ThingCmdEntity _value, $Res Function(_$_ThingCmdEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cmd = null,
    Object? uuid = null,
    Object? code = null,
    Object? data = freezed,
  }) {
    return _then(_$_ThingCmdEntity(
      cmd: null == cmd
          ? _value.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ThingCmdEntity implements _ThingCmdEntity {
  const _$_ThingCmdEntity(
      {required this.cmd,
      required this.uuid,
      required this.code,
      required this.data});

  factory _$_ThingCmdEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ThingCmdEntityFromJson(json);

  @override
  final int cmd;
  @override
  final String uuid;
  @override
  final int code;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'ThingCmdEntity(cmd: $cmd, uuid: $uuid, code: $code, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThingCmdEntity &&
            (identical(other.cmd, cmd) || other.cmd == cmd) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, cmd, uuid, code, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThingCmdEntityCopyWith<_$_ThingCmdEntity> get copyWith =>
      __$$_ThingCmdEntityCopyWithImpl<_$_ThingCmdEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThingCmdEntityToJson(
      this,
    );
  }
}

abstract class _ThingCmdEntity implements ThingCmdEntity {
  const factory _ThingCmdEntity(
      {required final int cmd,
      required final String uuid,
      required final int code,
      required final dynamic data}) = _$_ThingCmdEntity;

  factory _ThingCmdEntity.fromJson(Map<String, dynamic> json) =
      _$_ThingCmdEntity.fromJson;

  @override
  int get cmd;
  @override
  String get uuid;
  @override
  int get code;
  @override
  dynamic get data;
  @override
  @JsonKey(ignore: true)
  _$$_ThingCmdEntityCopyWith<_$_ThingCmdEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
