// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prepare_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PrepareState _$PrepareStateFromJson(Map<String, dynamic> json) {
  return _PrepareState.fromJson(json);
}

/// @nodoc
mixin _$PrepareState {
  bool get checked => throw _privateConstructorUsedError;
  bool get permissionGranted => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PrepareStateCopyWith<PrepareState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrepareStateCopyWith<$Res> {
  factory $PrepareStateCopyWith(
          PrepareState value, $Res Function(PrepareState) then) =
      _$PrepareStateCopyWithImpl<$Res, PrepareState>;
  @useResult
  $Res call({bool checked, bool permissionGranted});
}

/// @nodoc
class _$PrepareStateCopyWithImpl<$Res, $Val extends PrepareState>
    implements $PrepareStateCopyWith<$Res> {
  _$PrepareStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checked = null,
    Object? permissionGranted = null,
  }) {
    return _then(_value.copyWith(
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      permissionGranted: null == permissionGranted
          ? _value.permissionGranted
          : permissionGranted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PrepareStateCopyWith<$Res>
    implements $PrepareStateCopyWith<$Res> {
  factory _$$_PrepareStateCopyWith(
          _$_PrepareState value, $Res Function(_$_PrepareState) then) =
      __$$_PrepareStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool checked, bool permissionGranted});
}

/// @nodoc
class __$$_PrepareStateCopyWithImpl<$Res>
    extends _$PrepareStateCopyWithImpl<$Res, _$_PrepareState>
    implements _$$_PrepareStateCopyWith<$Res> {
  __$$_PrepareStateCopyWithImpl(
      _$_PrepareState _value, $Res Function(_$_PrepareState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checked = null,
    Object? permissionGranted = null,
  }) {
    return _then(_$_PrepareState(
      checked: null == checked
          ? _value.checked
          : checked // ignore: cast_nullable_to_non_nullable
              as bool,
      permissionGranted: null == permissionGranted
          ? _value.permissionGranted
          : permissionGranted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PrepareState implements _PrepareState {
  const _$_PrepareState(
      {required this.checked, required this.permissionGranted});

  factory _$_PrepareState.fromJson(Map<String, dynamic> json) =>
      _$$_PrepareStateFromJson(json);

  @override
  final bool checked;
  @override
  final bool permissionGranted;

  @override
  String toString() {
    return 'PrepareState(checked: $checked, permissionGranted: $permissionGranted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PrepareState &&
            (identical(other.checked, checked) || other.checked == checked) &&
            (identical(other.permissionGranted, permissionGranted) ||
                other.permissionGranted == permissionGranted));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, checked, permissionGranted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PrepareStateCopyWith<_$_PrepareState> get copyWith =>
      __$$_PrepareStateCopyWithImpl<_$_PrepareState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PrepareStateToJson(
      this,
    );
  }
}

abstract class _PrepareState implements PrepareState {
  const factory _PrepareState(
      {required final bool checked,
      required final bool permissionGranted}) = _$_PrepareState;

  factory _PrepareState.fromJson(Map<String, dynamic> json) =
      _$_PrepareState.fromJson;

  @override
  bool get checked;
  @override
  bool get permissionGranted;
  @override
  @JsonKey(ignore: true)
  _$$_PrepareStateCopyWith<_$_PrepareState> get copyWith =>
      throw _privateConstructorUsedError;
}
