// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'robot_map_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RobotMapEntity _$RobotMapEntityFromJson(Map<String, dynamic> json) {
  return _RobotMapEntity.fromJson(json);
}

/// @nodoc
mixin _$RobotMapEntity {
  MapStartPose? get mapStartPose => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  double? get resolution => throw _privateConstructorUsedError;
  bool? get mapBuildSuccess => throw _privateConstructorUsedError;
  ChargerPose? get chargerPose => throw _privateConstructorUsedError;
  List<int>? get mapData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RobotMapEntityCopyWith<RobotMapEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RobotMapEntityCopyWith<$Res> {
  factory $RobotMapEntityCopyWith(
          RobotMapEntity value, $Res Function(RobotMapEntity) then) =
      _$RobotMapEntityCopyWithImpl<$Res, RobotMapEntity>;
  @useResult
  $Res call(
      {MapStartPose? mapStartPose,
      int? height,
      int? width,
      double? resolution,
      bool? mapBuildSuccess,
      ChargerPose? chargerPose,
      List<int>? mapData});

  $MapStartPoseCopyWith<$Res>? get mapStartPose;
  $ChargerPoseCopyWith<$Res>? get chargerPose;
}

/// @nodoc
class _$RobotMapEntityCopyWithImpl<$Res, $Val extends RobotMapEntity>
    implements $RobotMapEntityCopyWith<$Res> {
  _$RobotMapEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapStartPose = freezed,
    Object? height = freezed,
    Object? width = freezed,
    Object? resolution = freezed,
    Object? mapBuildSuccess = freezed,
    Object? chargerPose = freezed,
    Object? mapData = freezed,
  }) {
    return _then(_value.copyWith(
      mapStartPose: freezed == mapStartPose
          ? _value.mapStartPose
          : mapStartPose // ignore: cast_nullable_to_non_nullable
              as MapStartPose?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as double?,
      mapBuildSuccess: freezed == mapBuildSuccess
          ? _value.mapBuildSuccess
          : mapBuildSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      chargerPose: freezed == chargerPose
          ? _value.chargerPose
          : chargerPose // ignore: cast_nullable_to_non_nullable
              as ChargerPose?,
      mapData: freezed == mapData
          ? _value.mapData
          : mapData // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MapStartPoseCopyWith<$Res>? get mapStartPose {
    if (_value.mapStartPose == null) {
      return null;
    }

    return $MapStartPoseCopyWith<$Res>(_value.mapStartPose!, (value) {
      return _then(_value.copyWith(mapStartPose: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChargerPoseCopyWith<$Res>? get chargerPose {
    if (_value.chargerPose == null) {
      return null;
    }

    return $ChargerPoseCopyWith<$Res>(_value.chargerPose!, (value) {
      return _then(_value.copyWith(chargerPose: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RobotMapEntityCopyWith<$Res>
    implements $RobotMapEntityCopyWith<$Res> {
  factory _$$_RobotMapEntityCopyWith(
          _$_RobotMapEntity value, $Res Function(_$_RobotMapEntity) then) =
      __$$_RobotMapEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MapStartPose? mapStartPose,
      int? height,
      int? width,
      double? resolution,
      bool? mapBuildSuccess,
      ChargerPose? chargerPose,
      List<int>? mapData});

  @override
  $MapStartPoseCopyWith<$Res>? get mapStartPose;
  @override
  $ChargerPoseCopyWith<$Res>? get chargerPose;
}

/// @nodoc
class __$$_RobotMapEntityCopyWithImpl<$Res>
    extends _$RobotMapEntityCopyWithImpl<$Res, _$_RobotMapEntity>
    implements _$$_RobotMapEntityCopyWith<$Res> {
  __$$_RobotMapEntityCopyWithImpl(
      _$_RobotMapEntity _value, $Res Function(_$_RobotMapEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mapStartPose = freezed,
    Object? height = freezed,
    Object? width = freezed,
    Object? resolution = freezed,
    Object? mapBuildSuccess = freezed,
    Object? chargerPose = freezed,
    Object? mapData = freezed,
  }) {
    return _then(_$_RobotMapEntity(
      mapStartPose: freezed == mapStartPose
          ? _value.mapStartPose
          : mapStartPose // ignore: cast_nullable_to_non_nullable
              as MapStartPose?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      resolution: freezed == resolution
          ? _value.resolution
          : resolution // ignore: cast_nullable_to_non_nullable
              as double?,
      mapBuildSuccess: freezed == mapBuildSuccess
          ? _value.mapBuildSuccess
          : mapBuildSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      chargerPose: freezed == chargerPose
          ? _value.chargerPose
          : chargerPose // ignore: cast_nullable_to_non_nullable
              as ChargerPose?,
      mapData: freezed == mapData
          ? _value._mapData
          : mapData // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RobotMapEntity implements _RobotMapEntity {
  const _$_RobotMapEntity(
      {this.mapStartPose,
      this.height,
      this.width,
      this.resolution,
      this.mapBuildSuccess,
      this.chargerPose,
      final List<int>? mapData})
      : _mapData = mapData;

  factory _$_RobotMapEntity.fromJson(Map<String, dynamic> json) =>
      _$$_RobotMapEntityFromJson(json);

  @override
  final MapStartPose? mapStartPose;
  @override
  final int? height;
  @override
  final int? width;
  @override
  final double? resolution;
  @override
  final bool? mapBuildSuccess;
  @override
  final ChargerPose? chargerPose;
  final List<int>? _mapData;
  @override
  List<int>? get mapData {
    final value = _mapData;
    if (value == null) return null;
    if (_mapData is EqualUnmodifiableListView) return _mapData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RobotMapEntity(mapStartPose: $mapStartPose, height: $height, width: $width, resolution: $resolution, mapBuildSuccess: $mapBuildSuccess, chargerPose: $chargerPose, mapData: $mapData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RobotMapEntity &&
            (identical(other.mapStartPose, mapStartPose) ||
                other.mapStartPose == mapStartPose) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.resolution, resolution) ||
                other.resolution == resolution) &&
            (identical(other.mapBuildSuccess, mapBuildSuccess) ||
                other.mapBuildSuccess == mapBuildSuccess) &&
            (identical(other.chargerPose, chargerPose) ||
                other.chargerPose == chargerPose) &&
            const DeepCollectionEquality().equals(other._mapData, _mapData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mapStartPose,
      height,
      width,
      resolution,
      mapBuildSuccess,
      chargerPose,
      const DeepCollectionEquality().hash(_mapData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RobotMapEntityCopyWith<_$_RobotMapEntity> get copyWith =>
      __$$_RobotMapEntityCopyWithImpl<_$_RobotMapEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RobotMapEntityToJson(
      this,
    );
  }
}

abstract class _RobotMapEntity implements RobotMapEntity {
  const factory _RobotMapEntity(
      {final MapStartPose? mapStartPose,
      final int? height,
      final int? width,
      final double? resolution,
      final bool? mapBuildSuccess,
      final ChargerPose? chargerPose,
      final List<int>? mapData}) = _$_RobotMapEntity;

  factory _RobotMapEntity.fromJson(Map<String, dynamic> json) =
      _$_RobotMapEntity.fromJson;

  @override
  MapStartPose? get mapStartPose;
  @override
  int? get height;
  @override
  int? get width;
  @override
  double? get resolution;
  @override
  bool? get mapBuildSuccess;
  @override
  ChargerPose? get chargerPose;
  @override
  List<int>? get mapData;
  @override
  @JsonKey(ignore: true)
  _$$_RobotMapEntityCopyWith<_$_RobotMapEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

ChargerPose _$ChargerPoseFromJson(Map<String, dynamic> json) {
  return _ChargerPose.fromJson(json);
}

/// @nodoc
mixin _$ChargerPose {
  double? get x => throw _privateConstructorUsedError;
  double? get y => throw _privateConstructorUsedError;
  double? get yaw => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChargerPoseCopyWith<ChargerPose> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChargerPoseCopyWith<$Res> {
  factory $ChargerPoseCopyWith(
          ChargerPose value, $Res Function(ChargerPose) then) =
      _$ChargerPoseCopyWithImpl<$Res, ChargerPose>;
  @useResult
  $Res call({double? x, double? y, double? yaw});
}

/// @nodoc
class _$ChargerPoseCopyWithImpl<$Res, $Val extends ChargerPose>
    implements $ChargerPoseCopyWith<$Res> {
  _$ChargerPoseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
    Object? yaw = freezed,
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
      yaw: freezed == yaw
          ? _value.yaw
          : yaw // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChargerPoseCopyWith<$Res>
    implements $ChargerPoseCopyWith<$Res> {
  factory _$$_ChargerPoseCopyWith(
          _$_ChargerPose value, $Res Function(_$_ChargerPose) then) =
      __$$_ChargerPoseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? x, double? y, double? yaw});
}

/// @nodoc
class __$$_ChargerPoseCopyWithImpl<$Res>
    extends _$ChargerPoseCopyWithImpl<$Res, _$_ChargerPose>
    implements _$$_ChargerPoseCopyWith<$Res> {
  __$$_ChargerPoseCopyWithImpl(
      _$_ChargerPose _value, $Res Function(_$_ChargerPose) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
    Object? yaw = freezed,
  }) {
    return _then(_$_ChargerPose(
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
      yaw: freezed == yaw
          ? _value.yaw
          : yaw // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChargerPose implements _ChargerPose {
  const _$_ChargerPose({this.x, this.y, this.yaw});

  factory _$_ChargerPose.fromJson(Map<String, dynamic> json) =>
      _$$_ChargerPoseFromJson(json);

  @override
  final double? x;
  @override
  final double? y;
  @override
  final double? yaw;

  @override
  String toString() {
    return 'ChargerPose(x: $x, y: $y, yaw: $yaw)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChargerPose &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.yaw, yaw) || other.yaw == yaw));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, yaw);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChargerPoseCopyWith<_$_ChargerPose> get copyWith =>
      __$$_ChargerPoseCopyWithImpl<_$_ChargerPose>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChargerPoseToJson(
      this,
    );
  }
}

abstract class _ChargerPose implements ChargerPose {
  const factory _ChargerPose(
      {final double? x, final double? y, final double? yaw}) = _$_ChargerPose;

  factory _ChargerPose.fromJson(Map<String, dynamic> json) =
      _$_ChargerPose.fromJson;

  @override
  double? get x;
  @override
  double? get y;
  @override
  double? get yaw;
  @override
  @JsonKey(ignore: true)
  _$$_ChargerPoseCopyWith<_$_ChargerPose> get copyWith =>
      throw _privateConstructorUsedError;
}

MapStartPose _$MapStartPoseFromJson(Map<String, dynamic> json) {
  return _MapStartPose.fromJson(json);
}

/// @nodoc
mixin _$MapStartPose {
  double? get x => throw _privateConstructorUsedError;
  double? get y => throw _privateConstructorUsedError;
  double? get yaw => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapStartPoseCopyWith<MapStartPose> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStartPoseCopyWith<$Res> {
  factory $MapStartPoseCopyWith(
          MapStartPose value, $Res Function(MapStartPose) then) =
      _$MapStartPoseCopyWithImpl<$Res, MapStartPose>;
  @useResult
  $Res call({double? x, double? y, double? yaw});
}

/// @nodoc
class _$MapStartPoseCopyWithImpl<$Res, $Val extends MapStartPose>
    implements $MapStartPoseCopyWith<$Res> {
  _$MapStartPoseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
    Object? yaw = freezed,
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
      yaw: freezed == yaw
          ? _value.yaw
          : yaw // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MapStartPoseCopyWith<$Res>
    implements $MapStartPoseCopyWith<$Res> {
  factory _$$_MapStartPoseCopyWith(
          _$_MapStartPose value, $Res Function(_$_MapStartPose) then) =
      __$$_MapStartPoseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? x, double? y, double? yaw});
}

/// @nodoc
class __$$_MapStartPoseCopyWithImpl<$Res>
    extends _$MapStartPoseCopyWithImpl<$Res, _$_MapStartPose>
    implements _$$_MapStartPoseCopyWith<$Res> {
  __$$_MapStartPoseCopyWithImpl(
      _$_MapStartPose _value, $Res Function(_$_MapStartPose) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = freezed,
    Object? y = freezed,
    Object? yaw = freezed,
  }) {
    return _then(_$_MapStartPose(
      x: freezed == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double?,
      y: freezed == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double?,
      yaw: freezed == yaw
          ? _value.yaw
          : yaw // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MapStartPose implements _MapStartPose {
  const _$_MapStartPose({this.x, this.y, this.yaw});

  factory _$_MapStartPose.fromJson(Map<String, dynamic> json) =>
      _$$_MapStartPoseFromJson(json);

  @override
  final double? x;
  @override
  final double? y;
  @override
  final double? yaw;

  @override
  String toString() {
    return 'MapStartPose(x: $x, y: $y, yaw: $yaw)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapStartPose &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.yaw, yaw) || other.yaw == yaw));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, x, y, yaw);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapStartPoseCopyWith<_$_MapStartPose> get copyWith =>
      __$$_MapStartPoseCopyWithImpl<_$_MapStartPose>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MapStartPoseToJson(
      this,
    );
  }
}

abstract class _MapStartPose implements MapStartPose {
  const factory _MapStartPose(
      {final double? x, final double? y, final double? yaw}) = _$_MapStartPose;

  factory _MapStartPose.fromJson(Map<String, dynamic> json) =
      _$_MapStartPose.fromJson;

  @override
  double? get x;
  @override
  double? get y;
  @override
  double? get yaw;
  @override
  @JsonKey(ignore: true)
  _$$_MapStartPoseCopyWith<_$_MapStartPose> get copyWith =>
      throw _privateConstructorUsedError;
}
