// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transport_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransportState _$TransportStateFromJson(Map<String, dynamic> json) {
  return _TransportState.fromJson(json);
}

/// @nodoc
mixin _$TransportState {
  String? get ssid => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  int? get progress => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  bool? get isFailed => throw _privateConstructorUsedError;
  bool? get isSuccess => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransportStateCopyWith<TransportState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransportStateCopyWith<$Res> {
  factory $TransportStateCopyWith(
          TransportState value, $Res Function(TransportState) then) =
      _$TransportStateCopyWithImpl<$Res, TransportState>;
  @useResult
  $Res call(
      {String? ssid,
      String? password,
      int? progress,
      String? status,
      bool? isFailed,
      bool? isSuccess});
}

/// @nodoc
class _$TransportStateCopyWithImpl<$Res, $Val extends TransportState>
    implements $TransportStateCopyWith<$Res> {
  _$TransportStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ssid = freezed,
    Object? password = freezed,
    Object? progress = freezed,
    Object? status = freezed,
    Object? isFailed = freezed,
    Object? isSuccess = freezed,
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
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isFailed: freezed == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransportStateCopyWith<$Res>
    implements $TransportStateCopyWith<$Res> {
  factory _$$_TransportStateCopyWith(
          _$_TransportState value, $Res Function(_$_TransportState) then) =
      __$$_TransportStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? ssid,
      String? password,
      int? progress,
      String? status,
      bool? isFailed,
      bool? isSuccess});
}

/// @nodoc
class __$$_TransportStateCopyWithImpl<$Res>
    extends _$TransportStateCopyWithImpl<$Res, _$_TransportState>
    implements _$$_TransportStateCopyWith<$Res> {
  __$$_TransportStateCopyWithImpl(
      _$_TransportState _value, $Res Function(_$_TransportState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ssid = freezed,
    Object? password = freezed,
    Object? progress = freezed,
    Object? status = freezed,
    Object? isFailed = freezed,
    Object? isSuccess = freezed,
  }) {
    return _then(_$_TransportState(
      ssid: freezed == ssid
          ? _value.ssid
          : ssid // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isFailed: freezed == isFailed
          ? _value.isFailed
          : isFailed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isSuccess: freezed == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransportState implements _TransportState {
  const _$_TransportState(
      {this.ssid,
      this.password,
      this.progress,
      this.status,
      this.isFailed,
      this.isSuccess});

  factory _$_TransportState.fromJson(Map<String, dynamic> json) =>
      _$$_TransportStateFromJson(json);

  @override
  final String? ssid;
  @override
  final String? password;
  @override
  final int? progress;
  @override
  final String? status;
  @override
  final bool? isFailed;
  @override
  final bool? isSuccess;

  @override
  String toString() {
    return 'TransportState(ssid: $ssid, password: $password, progress: $progress, status: $status, isFailed: $isFailed, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransportState &&
            (identical(other.ssid, ssid) || other.ssid == ssid) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isFailed, isFailed) ||
                other.isFailed == isFailed) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, ssid, password, progress, status, isFailed, isSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransportStateCopyWith<_$_TransportState> get copyWith =>
      __$$_TransportStateCopyWithImpl<_$_TransportState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransportStateToJson(
      this,
    );
  }
}

abstract class _TransportState implements TransportState {
  const factory _TransportState(
      {final String? ssid,
      final String? password,
      final int? progress,
      final String? status,
      final bool? isFailed,
      final bool? isSuccess}) = _$_TransportState;

  factory _TransportState.fromJson(Map<String, dynamic> json) =
      _$_TransportState.fromJson;

  @override
  String? get ssid;
  @override
  String? get password;
  @override
  int? get progress;
  @override
  String? get status;
  @override
  bool? get isFailed;
  @override
  bool? get isSuccess;
  @override
  @JsonKey(ignore: true)
  _$$_TransportStateCopyWith<_$_TransportState> get copyWith =>
      throw _privateConstructorUsedError;
}
