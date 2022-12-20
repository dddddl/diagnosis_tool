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
mixin _$RobotState {
  Image? get image => throw _privateConstructorUsedError;

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
  $Res call({Image? image});
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
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
    ) as $Val);
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
  $Res call({Image? image});
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
    Object? image = freezed,
  }) {
    return _then(_$_RobotState(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
    ));
  }
}

/// @nodoc

class _$_RobotState implements _RobotState {
  const _$_RobotState({required this.image});

  @override
  final Image? image;

  @override
  String toString() {
    return 'RobotState(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RobotState &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RobotStateCopyWith<_$_RobotState> get copyWith =>
      __$$_RobotStateCopyWithImpl<_$_RobotState>(this, _$identity);
}

abstract class _RobotState implements RobotState {
  const factory _RobotState({required final Image? image}) = _$_RobotState;

  @override
  Image? get image;
  @override
  @JsonKey(ignore: true)
  _$$_RobotStateCopyWith<_$_RobotState> get copyWith =>
      throw _privateConstructorUsedError;
}
