// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Command<T> _$CommandFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _Command<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$Command<T> {
  int get cmd => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  int get timeStamps => throw _privateConstructorUsedError;
  T get params => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommandCopyWith<T, Command<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandCopyWith<T, $Res> {
  factory $CommandCopyWith(Command<T> value, $Res Function(Command<T>) then) =
      _$CommandCopyWithImpl<T, $Res, Command<T>>;
  @useResult
  $Res call({int cmd, String uuid, int timeStamps, T params});
}

/// @nodoc
class _$CommandCopyWithImpl<T, $Res, $Val extends Command<T>>
    implements $CommandCopyWith<T, $Res> {
  _$CommandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cmd = null,
    Object? uuid = null,
    Object? timeStamps = null,
    Object? params = freezed,
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
      timeStamps: null == timeStamps
          ? _value.timeStamps
          : timeStamps // ignore: cast_nullable_to_non_nullable
              as int,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as T,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CommandCopyWith<T, $Res>
    implements $CommandCopyWith<T, $Res> {
  factory _$$_CommandCopyWith(
          _$_Command<T> value, $Res Function(_$_Command<T>) then) =
      __$$_CommandCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int cmd, String uuid, int timeStamps, T params});
}

/// @nodoc
class __$$_CommandCopyWithImpl<T, $Res>
    extends _$CommandCopyWithImpl<T, $Res, _$_Command<T>>
    implements _$$_CommandCopyWith<T, $Res> {
  __$$_CommandCopyWithImpl(
      _$_Command<T> _value, $Res Function(_$_Command<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cmd = null,
    Object? uuid = null,
    Object? timeStamps = null,
    Object? params = freezed,
  }) {
    return _then(_$_Command<T>(
      cmd: null == cmd
          ? _value.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      timeStamps: null == timeStamps
          ? _value.timeStamps
          : timeStamps // ignore: cast_nullable_to_non_nullable
              as int,
      params: freezed == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_Command<T> implements _Command<T> {
  const _$_Command(
      {required this.cmd,
      required this.uuid,
      required this.timeStamps,
      required this.params});

  factory _$_Command.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_CommandFromJson(json, fromJsonT);

  @override
  final int cmd;
  @override
  final String uuid;
  @override
  final int timeStamps;
  @override
  final T params;

  @override
  String toString() {
    return 'Command<$T>(cmd: $cmd, uuid: $uuid, timeStamps: $timeStamps, params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Command<T> &&
            (identical(other.cmd, cmd) || other.cmd == cmd) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.timeStamps, timeStamps) ||
                other.timeStamps == timeStamps) &&
            const DeepCollectionEquality().equals(other.params, params));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cmd, uuid, timeStamps,
      const DeepCollectionEquality().hash(params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommandCopyWith<T, _$_Command<T>> get copyWith =>
      __$$_CommandCopyWithImpl<T, _$_Command<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_CommandToJson<T>(this, toJsonT);
  }
}

abstract class _Command<T> implements Command<T> {
  const factory _Command(
      {required final int cmd,
      required final String uuid,
      required final int timeStamps,
      required final T params}) = _$_Command<T>;

  factory _Command.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_Command<T>.fromJson;

  @override
  int get cmd;
  @override
  String get uuid;
  @override
  int get timeStamps;
  @override
  T get params;
  @override
  @JsonKey(ignore: true)
  _$$_CommandCopyWith<T, _$_Command<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
