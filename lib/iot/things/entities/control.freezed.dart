// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'control.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ControlParams _$ControlParamsFromJson(Map<String, dynamic> json) {
  return _ControlParams.fromJson(json);
}

/// @nodoc
mixin _$ControlParams {
  int get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ControlParamsCopyWith<ControlParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ControlParamsCopyWith<$Res> {
  factory $ControlParamsCopyWith(
          ControlParams value, $Res Function(ControlParams) then) =
      _$ControlParamsCopyWithImpl<$Res, ControlParams>;
  @useResult
  $Res call({int status});
}

/// @nodoc
class _$ControlParamsCopyWithImpl<$Res, $Val extends ControlParams>
    implements $ControlParamsCopyWith<$Res> {
  _$ControlParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ControlParamsCopyWith<$Res>
    implements $ControlParamsCopyWith<$Res> {
  factory _$$_ControlParamsCopyWith(
          _$_ControlParams value, $Res Function(_$_ControlParams) then) =
      __$$_ControlParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int status});
}

/// @nodoc
class __$$_ControlParamsCopyWithImpl<$Res>
    extends _$ControlParamsCopyWithImpl<$Res, _$_ControlParams>
    implements _$$_ControlParamsCopyWith<$Res> {
  __$$_ControlParamsCopyWithImpl(
      _$_ControlParams _value, $Res Function(_$_ControlParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$_ControlParams(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ControlParams implements _ControlParams {
  const _$_ControlParams({required this.status});

  factory _$_ControlParams.fromJson(Map<String, dynamic> json) =>
      _$$_ControlParamsFromJson(json);

  @override
  final int status;

  @override
  String toString() {
    return 'ControlParams(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ControlParams &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ControlParamsCopyWith<_$_ControlParams> get copyWith =>
      __$$_ControlParamsCopyWithImpl<_$_ControlParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ControlParamsToJson(
      this,
    );
  }
}

abstract class _ControlParams implements ControlParams {
  const factory _ControlParams({required final int status}) = _$_ControlParams;

  factory _ControlParams.fromJson(Map<String, dynamic> json) =
      _$_ControlParams.fromJson;

  @override
  int get status;
  @override
  @JsonKey(ignore: true)
  _$$_ControlParamsCopyWith<_$_ControlParams> get copyWith =>
      throw _privateConstructorUsedError;
}
