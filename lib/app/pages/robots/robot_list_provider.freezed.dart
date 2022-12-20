// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'robot_list_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RobotListState {
  List<Robot>? get robots => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RobotListStateCopyWith<RobotListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RobotListStateCopyWith<$Res> {
  factory $RobotListStateCopyWith(
          RobotListState value, $Res Function(RobotListState) then) =
      _$RobotListStateCopyWithImpl<$Res, RobotListState>;
  @useResult
  $Res call({List<Robot>? robots});
}

/// @nodoc
class _$RobotListStateCopyWithImpl<$Res, $Val extends RobotListState>
    implements $RobotListStateCopyWith<$Res> {
  _$RobotListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? robots = freezed,
  }) {
    return _then(_value.copyWith(
      robots: freezed == robots
          ? _value.robots
          : robots // ignore: cast_nullable_to_non_nullable
              as List<Robot>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RobotListStateCopyWith<$Res>
    implements $RobotListStateCopyWith<$Res> {
  factory _$$_RobotListStateCopyWith(
          _$_RobotListState value, $Res Function(_$_RobotListState) then) =
      __$$_RobotListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Robot>? robots});
}

/// @nodoc
class __$$_RobotListStateCopyWithImpl<$Res>
    extends _$RobotListStateCopyWithImpl<$Res, _$_RobotListState>
    implements _$$_RobotListStateCopyWith<$Res> {
  __$$_RobotListStateCopyWithImpl(
      _$_RobotListState _value, $Res Function(_$_RobotListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? robots = freezed,
  }) {
    return _then(_$_RobotListState(
      robots: freezed == robots
          ? _value._robots
          : robots // ignore: cast_nullable_to_non_nullable
              as List<Robot>?,
    ));
  }
}

/// @nodoc

class _$_RobotListState implements _RobotListState {
  _$_RobotListState({final List<Robot>? robots}) : _robots = robots;

  final List<Robot>? _robots;
  @override
  List<Robot>? get robots {
    final value = _robots;
    if (value == null) return null;
    if (_robots is EqualUnmodifiableListView) return _robots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RobotListState(robots: $robots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RobotListState &&
            const DeepCollectionEquality().equals(other._robots, _robots));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_robots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RobotListStateCopyWith<_$_RobotListState> get copyWith =>
      __$$_RobotListStateCopyWithImpl<_$_RobotListState>(this, _$identity);
}

abstract class _RobotListState implements RobotListState {
  factory _RobotListState({final List<Robot>? robots}) = _$_RobotListState;

  @override
  List<Robot>? get robots;
  @override
  @JsonKey(ignore: true)
  _$$_RobotListStateCopyWith<_$_RobotListState> get copyWith =>
      throw _privateConstructorUsedError;
}
