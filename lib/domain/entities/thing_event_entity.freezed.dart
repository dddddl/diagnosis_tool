// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thing_event_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ThingEventEntity _$ThingEventEntityFromJson(Map<String, dynamic> json) {
  return _ThingEventEntity.fromJson(json);
}

/// @nodoc
mixin _$ThingEventEntity {
  int get cmd => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  String get eventId => throw _privateConstructorUsedError;
  String get eventType => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  dynamic get param => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThingEventEntityCopyWith<ThingEventEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThingEventEntityCopyWith<$Res> {
  factory $ThingEventEntityCopyWith(
          ThingEventEntity value, $Res Function(ThingEventEntity) then) =
      _$ThingEventEntityCopyWithImpl<$Res, ThingEventEntity>;
  @useResult
  $Res call(
      {int cmd,
      String uuid,
      String eventId,
      String eventType,
      int timestamp,
      dynamic param});
}

/// @nodoc
class _$ThingEventEntityCopyWithImpl<$Res, $Val extends ThingEventEntity>
    implements $ThingEventEntityCopyWith<$Res> {
  _$ThingEventEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cmd = null,
    Object? uuid = null,
    Object? eventId = null,
    Object? eventType = null,
    Object? timestamp = null,
    Object? param = freezed,
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
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      param: freezed == param
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ThingEventEntityCopyWith<$Res>
    implements $ThingEventEntityCopyWith<$Res> {
  factory _$$_ThingEventEntityCopyWith(
          _$_ThingEventEntity value, $Res Function(_$_ThingEventEntity) then) =
      __$$_ThingEventEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int cmd,
      String uuid,
      String eventId,
      String eventType,
      int timestamp,
      dynamic param});
}

/// @nodoc
class __$$_ThingEventEntityCopyWithImpl<$Res>
    extends _$ThingEventEntityCopyWithImpl<$Res, _$_ThingEventEntity>
    implements _$$_ThingEventEntityCopyWith<$Res> {
  __$$_ThingEventEntityCopyWithImpl(
      _$_ThingEventEntity _value, $Res Function(_$_ThingEventEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cmd = null,
    Object? uuid = null,
    Object? eventId = null,
    Object? eventType = null,
    Object? timestamp = null,
    Object? param = freezed,
  }) {
    return _then(_$_ThingEventEntity(
      cmd: null == cmd
          ? _value.cmd
          : cmd // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      eventId: null == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as String,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      param: freezed == param
          ? _value.param
          : param // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ThingEventEntity implements _ThingEventEntity {
  const _$_ThingEventEntity(
      {required this.cmd,
      required this.uuid,
      required this.eventId,
      required this.eventType,
      required this.timestamp,
      required this.param});

  factory _$_ThingEventEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ThingEventEntityFromJson(json);

  @override
  final int cmd;
  @override
  final String uuid;
  @override
  final String eventId;
  @override
  final String eventType;
  @override
  final int timestamp;
  @override
  final dynamic param;

  @override
  String toString() {
    return 'ThingEventEntity(cmd: $cmd, uuid: $uuid, eventId: $eventId, eventType: $eventType, timestamp: $timestamp, param: $param)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ThingEventEntity &&
            (identical(other.cmd, cmd) || other.cmd == cmd) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.eventId, eventId) || other.eventId == eventId) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other.param, param));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cmd, uuid, eventId, eventType,
      timestamp, const DeepCollectionEquality().hash(param));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ThingEventEntityCopyWith<_$_ThingEventEntity> get copyWith =>
      __$$_ThingEventEntityCopyWithImpl<_$_ThingEventEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ThingEventEntityToJson(
      this,
    );
  }
}

abstract class _ThingEventEntity implements ThingEventEntity {
  const factory _ThingEventEntity(
      {required final int cmd,
      required final String uuid,
      required final String eventId,
      required final String eventType,
      required final int timestamp,
      required final dynamic param}) = _$_ThingEventEntity;

  factory _ThingEventEntity.fromJson(Map<String, dynamic> json) =
      _$_ThingEventEntity.fromJson;

  @override
  int get cmd;
  @override
  String get uuid;
  @override
  String get eventId;
  @override
  String get eventType;
  @override
  int get timestamp;
  @override
  dynamic get param;
  @override
  @JsonKey(ignore: true)
  _$$_ThingEventEntityCopyWith<_$_ThingEventEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
