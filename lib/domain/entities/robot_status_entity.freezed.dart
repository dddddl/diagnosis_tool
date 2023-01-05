// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'robot_status_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RobotState _$RobotStateFromJson(Map<String, dynamic> json) {
  return _RobotState.fromJson(json);
}

/// @nodoc
mixin _$RobotState {
  String? get name => throw _privateConstructorUsedError;
  int? get state => throw _privateConstructorUsedError;
  MachineState? get machineState => throw _privateConstructorUsedError;
  int? get power => throw _privateConstructorUsedError;
  double? get timestamp => throw _privateConstructorUsedError;
  double? get acreage => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;
  double? get moveSpeed => throw _privateConstructorUsedError;
  double? get motorRotateSpeed => throw _privateConstructorUsedError;
  Position? get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RobotStateCopyWith<RobotState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RobotStateCopyWith<$Res> {
  factory $RobotStateCopyWith(
          RobotState value, $Res Function(RobotState) then) =
      _$RobotStateCopyWithImpl<$Res, RobotState>;
  @useResult
  $Res call(
      {String? name,
      int? state,
      MachineState? machineState,
      int? power,
      double? timestamp,
      double? acreage,
      int? duration,
      double? moveSpeed,
      double? motorRotateSpeed,
      Position? position});

  $PositionCopyWith<$Res>? get position;
}

/// @nodoc
class _$RobotStateCopyWithImpl<$Res, $Val extends RobotState>
    implements $RobotStateCopyWith<$Res> {
  _$RobotStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? state = freezed,
    Object? machineState = freezed,
    Object? power = freezed,
    Object? timestamp = freezed,
    Object? acreage = freezed,
    Object? duration = freezed,
    Object? moveSpeed = freezed,
    Object? motorRotateSpeed = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int?,
      machineState: freezed == machineState
          ? _value.machineState
          : machineState // ignore: cast_nullable_to_non_nullable
              as MachineState?,
      power: freezed == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double?,
      acreage: freezed == acreage
          ? _value.acreage
          : acreage // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      moveSpeed: freezed == moveSpeed
          ? _value.moveSpeed
          : moveSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      motorRotateSpeed: freezed == motorRotateSpeed
          ? _value.motorRotateSpeed
          : motorRotateSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PositionCopyWith<$Res>? get position {
    if (_value.position == null) {
      return null;
    }

    return $PositionCopyWith<$Res>(_value.position!, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RobotStateCopyWith<$Res>
    implements $RobotStateCopyWith<$Res> {
  factory _$$_RobotStateCopyWith(
          _$_RobotState value, $Res Function(_$_RobotState) then) =
      __$$_RobotStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      int? state,
      MachineState? machineState,
      int? power,
      double? timestamp,
      double? acreage,
      int? duration,
      double? moveSpeed,
      double? motorRotateSpeed,
      Position? position});

  @override
  $PositionCopyWith<$Res>? get position;
}

/// @nodoc
class __$$_RobotStateCopyWithImpl<$Res>
    extends _$RobotStateCopyWithImpl<$Res, _$_RobotState>
    implements _$$_RobotStateCopyWith<$Res> {
  __$$_RobotStateCopyWithImpl(
      _$_RobotState _value, $Res Function(_$_RobotState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? state = freezed,
    Object? machineState = freezed,
    Object? power = freezed,
    Object? timestamp = freezed,
    Object? acreage = freezed,
    Object? duration = freezed,
    Object? moveSpeed = freezed,
    Object? motorRotateSpeed = freezed,
    Object? position = freezed,
  }) {
    return _then(_$_RobotState(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as int?,
      machineState: freezed == machineState
          ? _value.machineState
          : machineState // ignore: cast_nullable_to_non_nullable
              as MachineState?,
      power: freezed == power
          ? _value.power
          : power // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as double?,
      acreage: freezed == acreage
          ? _value.acreage
          : acreage // ignore: cast_nullable_to_non_nullable
              as double?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      moveSpeed: freezed == moveSpeed
          ? _value.moveSpeed
          : moveSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      motorRotateSpeed: freezed == motorRotateSpeed
          ? _value.motorRotateSpeed
          : motorRotateSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Position?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RobotState implements _RobotState {
  const _$_RobotState(
      {this.name,
      this.state,
      this.machineState,
      this.power,
      this.timestamp,
      this.acreage,
      this.duration,
      this.moveSpeed,
      this.motorRotateSpeed,
      this.position});

  factory _$_RobotState.fromJson(Map<String, dynamic> json) =>
      _$$_RobotStateFromJson(json);

  @override
  final String? name;
  @override
  final int? state;
  @override
  final MachineState? machineState;
  @override
  final int? power;
  @override
  final double? timestamp;
  @override
  final double? acreage;
  @override
  final int? duration;
  @override
  final double? moveSpeed;
  @override
  final double? motorRotateSpeed;
  @override
  final Position? position;

  @override
  String toString() {
    return 'RobotState(name: $name, state: $state, machineState: $machineState, power: $power, timestamp: $timestamp, acreage: $acreage, duration: $duration, moveSpeed: $moveSpeed, motorRotateSpeed: $motorRotateSpeed, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RobotState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.machineState, machineState) ||
                other.machineState == machineState) &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.acreage, acreage) || other.acreage == acreage) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.moveSpeed, moveSpeed) ||
                other.moveSpeed == moveSpeed) &&
            (identical(other.motorRotateSpeed, motorRotateSpeed) ||
                other.motorRotateSpeed == motorRotateSpeed) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, state, machineState, power,
      timestamp, acreage, duration, moveSpeed, motorRotateSpeed, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RobotStateCopyWith<_$_RobotState> get copyWith =>
      __$$_RobotStateCopyWithImpl<_$_RobotState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RobotStateToJson(
      this,
    );
  }
}

abstract class _RobotState implements RobotState {
  const factory _RobotState(
      {final String? name,
      final int? state,
      final MachineState? machineState,
      final int? power,
      final double? timestamp,
      final double? acreage,
      final int? duration,
      final double? moveSpeed,
      final double? motorRotateSpeed,
      final Position? position}) = _$_RobotState;

  factory _RobotState.fromJson(Map<String, dynamic> json) =
      _$_RobotState.fromJson;

  @override
  String? get name;
  @override
  int? get state;
  @override
  MachineState? get machineState;
  @override
  int? get power;
  @override
  double? get timestamp;
  @override
  double? get acreage;
  @override
  int? get duration;
  @override
  double? get moveSpeed;
  @override
  double? get motorRotateSpeed;
  @override
  Position? get position;
  @override
  @JsonKey(ignore: true)
  _$$_RobotStateCopyWith<_$_RobotState> get copyWith =>
      throw _privateConstructorUsedError;
}

Position _$PositionFromJson(Map<String, dynamic> json) {
  return _Position.fromJson(json);
}

/// @nodoc
mixin _$Position {
  double? get x => throw _privateConstructorUsedError;
  double? get y => throw _privateConstructorUsedError;
  double? get z => throw _privateConstructorUsedError;
  double? get w => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PositionCopyWith<Position> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionCopyWith<$Res> {
  factory $PositionCopyWith(Position value, $Res Function(Position) then) =
      _$PositionCopyWithImpl<$Res, Position>;
  @useResult
  $Res call({double? x, double? y, double? z, double? w});
}

/// @nodoc
class _$PositionCopyWithImpl<$Res, $Val extends Position>
    implements $PositionCopyWith<$Res> {
  _$PositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
    Object? z = freezed,
    Object? w = freezed,
  }) {
    return _then(_value.copyWith(
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
      z: freezed == z
          ? _value.z
          : z // ignore: cast_nullable_to_non_nullable
              as double?,
      w: freezed == w
          ? _value.w
          : w // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PositionCopyWith<$Res> implements $PositionCopyWith<$Res> {
  factory _$$_PositionCopyWith(
          _$_Position value, $Res Function(_$_Position) then) =
      __$$_PositionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? x, double? y, double? z, double? w});
}

/// @nodoc
class __$$_PositionCopyWithImpl<$Res>
    extends _$PositionCopyWithImpl<$Res, _$_Position>
    implements _$$_PositionCopyWith<$Res> {
  __$$_PositionCopyWithImpl(
      _$_Position _value, $Res Function(_$_Position) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
    Object? z = freezed,
    Object? w = freezed,
  }) {
    return _then(_$_Position(
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
      z: freezed == z
          ? _value.z
          : z // ignore: cast_nullable_to_non_nullable
              as double?,
      w: freezed == w
          ? _value.w
          : w // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Position implements _Position {
  const _$_Position({this.x, this.y, this.z, this.w});

  factory _$_Position.fromJson(Map<String, dynamic> json) =>
      _$$_PositionFromJson(json);

  @override
  final double? x;
  @override
  final double? y;
  @override
  final double? z;
  @override
  final double? w;

  @override
  String toString() {
    return 'Position(x: $x, y: $y, z: $z, w: $w)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Position &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.z, z) || other.z == z) &&
            (identical(other.w, w) || other.w == w));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, z, w);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PositionCopyWith<_$_Position> get copyWith =>
      __$$_PositionCopyWithImpl<_$_Position>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PositionToJson(
      this,
    );
  }
}

abstract class _Position implements Position {
  const factory _Position(
      {final double? x,
      final double? y,
      final double? z,
      final double? w}) = _$_Position;

  factory _Position.fromJson(Map<String, dynamic> json) = _$_Position.fromJson;

  @override
  double? get x;
  @override
  double? get y;
  @override
  double? get z;
  @override
  double? get w;
  @override
  @JsonKey(ignore: true)
  _$$_PositionCopyWith<_$_Position> get copyWith =>
      throw _privateConstructorUsedError;
}
