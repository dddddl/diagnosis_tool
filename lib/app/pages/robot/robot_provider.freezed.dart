// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'robot_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RobotViewState {
  RobotState get robotState => throw _privateConstructorUsedError;
  bool get mqttConnected => throw _privateConstructorUsedError;
  List<String> get notifications => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RobotViewStateCopyWith<RobotViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RobotViewStateCopyWith<$Res> {
  factory $RobotViewStateCopyWith(
          RobotViewState value, $Res Function(RobotViewState) then) =
      _$RobotViewStateCopyWithImpl<$Res, RobotViewState>;
  @useResult
  $Res call(
      {RobotState robotState, bool mqttConnected, List<String> notifications});

  $RobotStateCopyWith<$Res> get robotState;
}

/// @nodoc
class _$RobotViewStateCopyWithImpl<$Res, $Val extends RobotViewState>
    implements $RobotViewStateCopyWith<$Res> {
  _$RobotViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? robotState = null,
    Object? mqttConnected = null,
    Object? notifications = null,
  }) {
    return _then(_value.copyWith(
      robotState: null == robotState
          ? _value.robotState
          : robotState // ignore: cast_nullable_to_non_nullable
              as RobotState,
      mqttConnected: null == mqttConnected
          ? _value.mqttConnected
          : mqttConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RobotStateCopyWith<$Res> get robotState {
    return $RobotStateCopyWith<$Res>(_value.robotState, (value) {
      return _then(_value.copyWith(robotState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RobotViewStateCopyWith<$Res>
    implements $RobotViewStateCopyWith<$Res> {
  factory _$$_RobotViewStateCopyWith(
          _$_RobotViewState value, $Res Function(_$_RobotViewState) then) =
      __$$_RobotViewStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RobotState robotState, bool mqttConnected, List<String> notifications});

  @override
  $RobotStateCopyWith<$Res> get robotState;
}

/// @nodoc
class __$$_RobotViewStateCopyWithImpl<$Res>
    extends _$RobotViewStateCopyWithImpl<$Res, _$_RobotViewState>
    implements _$$_RobotViewStateCopyWith<$Res> {
  __$$_RobotViewStateCopyWithImpl(
      _$_RobotViewState _value, $Res Function(_$_RobotViewState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? robotState = null,
    Object? mqttConnected = null,
    Object? notifications = null,
  }) {
    return _then(_$_RobotViewState(
      robotState: null == robotState
          ? _value.robotState
          : robotState // ignore: cast_nullable_to_non_nullable
              as RobotState,
      mqttConnected: null == mqttConnected
          ? _value.mqttConnected
          : mqttConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_RobotViewState implements _RobotViewState {
  const _$_RobotViewState(
      {required this.robotState,
      this.mqttConnected = false,
      final List<String> notifications = const []})
      : _notifications = notifications;

  @override
  final RobotState robotState;
  @override
  @JsonKey()
  final bool mqttConnected;
  final List<String> _notifications;
  @override
  @JsonKey()
  List<String> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'RobotViewState(robotState: $robotState, mqttConnected: $mqttConnected, notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RobotViewState &&
            (identical(other.robotState, robotState) ||
                other.robotState == robotState) &&
            (identical(other.mqttConnected, mqttConnected) ||
                other.mqttConnected == mqttConnected) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(runtimeType, robotState, mqttConnected,
      const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RobotViewStateCopyWith<_$_RobotViewState> get copyWith =>
      __$$_RobotViewStateCopyWithImpl<_$_RobotViewState>(this, _$identity);
}

abstract class _RobotViewState implements RobotViewState {
  const factory _RobotViewState(
      {required final RobotState robotState,
      final bool mqttConnected,
      final List<String> notifications}) = _$_RobotViewState;

  @override
  RobotState get robotState;
  @override
  bool get mqttConnected;
  @override
  List<String> get notifications;
  @override
  @JsonKey(ignore: true)
  _$$_RobotViewStateCopyWith<_$_RobotViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
