// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WifiState _$WifiStateFromJson(Map<String, dynamic> json) {
  return _WifiState.fromJson(json);
}

/// @nodoc
mixin _$WifiState {
  String? get ssid => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  bool get obscureText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WifiStateCopyWith<WifiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WifiStateCopyWith<$Res> {
  factory $WifiStateCopyWith(WifiState value, $Res Function(WifiState) then) =
      _$WifiStateCopyWithImpl<$Res, WifiState>;
  @useResult
  $Res call({String? ssid, String? password, bool obscureText});
}

/// @nodoc
class _$WifiStateCopyWithImpl<$Res, $Val extends WifiState>
    implements $WifiStateCopyWith<$Res> {
  _$WifiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ssid = freezed,
    Object? password = freezed,
    Object? obscureText = null,
  }) {
    return _then(_value.copyWith(
      ssid: freezed == ssid
          ? _value.ssid
          : ssid // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WifiStateCopyWith<$Res> implements $WifiStateCopyWith<$Res> {
  factory _$$_WifiStateCopyWith(
          _$_WifiState value, $Res Function(_$_WifiState) then) =
      __$$_WifiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? ssid, String? password, bool obscureText});
}

/// @nodoc
class __$$_WifiStateCopyWithImpl<$Res>
    extends _$WifiStateCopyWithImpl<$Res, _$_WifiState>
    implements _$$_WifiStateCopyWith<$Res> {
  __$$_WifiStateCopyWithImpl(
      _$_WifiState _value, $Res Function(_$_WifiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ssid = freezed,
    Object? password = freezed,
    Object? obscureText = null,
  }) {
    return _then(_$_WifiState(
      ssid: freezed == ssid
          ? _value.ssid
          : ssid // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WifiState implements _WifiState {
  const _$_WifiState({this.ssid, this.password, this.obscureText = false});

  factory _$_WifiState.fromJson(Map<String, dynamic> json) =>
      _$$_WifiStateFromJson(json);

  @override
  final String? ssid;
  @override
  final String? password;
  @override
  @JsonKey()
  final bool obscureText;

  @override
  String toString() {
    return 'WifiState(ssid: $ssid, password: $password, obscureText: $obscureText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WifiState &&
            (identical(other.ssid, ssid) || other.ssid == ssid) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.obscureText, obscureText) ||
                other.obscureText == obscureText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ssid, password, obscureText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WifiStateCopyWith<_$_WifiState> get copyWith =>
      __$$_WifiStateCopyWithImpl<_$_WifiState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WifiStateToJson(
      this,
    );
  }
}

abstract class _WifiState implements WifiState {
  const factory _WifiState(
      {final String? ssid,
      final String? password,
      final bool obscureText}) = _$_WifiState;

  factory _WifiState.fromJson(Map<String, dynamic> json) =
      _$_WifiState.fromJson;

  @override
  String? get ssid;
  @override
  String? get password;
  @override
  bool get obscureText;
  @override
  @JsonKey(ignore: true)
  _$$_WifiStateCopyWith<_$_WifiState> get copyWith =>
      throw _privateConstructorUsedError;
}
