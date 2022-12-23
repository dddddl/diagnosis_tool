// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MapState {
  Image? get image => throw _privateConstructorUsedError;
  double get currentScale => throw _privateConstructorUsedError;
  Offset get dragViewOffset => throw _privateConstructorUsedError;
  MapMode get mapMode => throw _privateConstructorUsedError;
  List<WallData>? get walls => throw _privateConstructorUsedError;
  WallData? get currentWall => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapStateCopyWith<MapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapStateCopyWith<$Res> {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) then) =
      _$MapStateCopyWithImpl<$Res, MapState>;
  @useResult
  $Res call(
      {Image? image,
      double currentScale,
      Offset dragViewOffset,
      MapMode mapMode,
      List<WallData>? walls,
      WallData? currentWall});

  $WallDataCopyWith<$Res>? get currentWall;
}

/// @nodoc
class _$MapStateCopyWithImpl<$Res, $Val extends MapState>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? currentScale = null,
    Object? dragViewOffset = null,
    Object? mapMode = null,
    Object? walls = freezed,
    Object? currentWall = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
      currentScale: null == currentScale
          ? _value.currentScale
          : currentScale // ignore: cast_nullable_to_non_nullable
              as double,
      dragViewOffset: null == dragViewOffset
          ? _value.dragViewOffset
          : dragViewOffset // ignore: cast_nullable_to_non_nullable
              as Offset,
      mapMode: null == mapMode
          ? _value.mapMode
          : mapMode // ignore: cast_nullable_to_non_nullable
              as MapMode,
      walls: freezed == walls
          ? _value.walls
          : walls // ignore: cast_nullable_to_non_nullable
              as List<WallData>?,
      currentWall: freezed == currentWall
          ? _value.currentWall
          : currentWall // ignore: cast_nullable_to_non_nullable
              as WallData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WallDataCopyWith<$Res>? get currentWall {
    if (_value.currentWall == null) {
      return null;
    }

    return $WallDataCopyWith<$Res>(_value.currentWall!, (value) {
      return _then(_value.copyWith(currentWall: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$$_MapStateCopyWith(
          _$_MapState value, $Res Function(_$_MapState) then) =
      __$$_MapStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Image? image,
      double currentScale,
      Offset dragViewOffset,
      MapMode mapMode,
      List<WallData>? walls,
      WallData? currentWall});

  @override
  $WallDataCopyWith<$Res>? get currentWall;
}

/// @nodoc
class __$$_MapStateCopyWithImpl<$Res>
    extends _$MapStateCopyWithImpl<$Res, _$_MapState>
    implements _$$_MapStateCopyWith<$Res> {
  __$$_MapStateCopyWithImpl(
      _$_MapState _value, $Res Function(_$_MapState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? currentScale = null,
    Object? dragViewOffset = null,
    Object? mapMode = null,
    Object? walls = freezed,
    Object? currentWall = freezed,
  }) {
    return _then(_$_MapState(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
      currentScale: null == currentScale
          ? _value.currentScale
          : currentScale // ignore: cast_nullable_to_non_nullable
              as double,
      dragViewOffset: null == dragViewOffset
          ? _value.dragViewOffset
          : dragViewOffset // ignore: cast_nullable_to_non_nullable
              as Offset,
      mapMode: null == mapMode
          ? _value.mapMode
          : mapMode // ignore: cast_nullable_to_non_nullable
              as MapMode,
      walls: freezed == walls
          ? _value._walls
          : walls // ignore: cast_nullable_to_non_nullable
              as List<WallData>?,
      currentWall: freezed == currentWall
          ? _value.currentWall
          : currentWall // ignore: cast_nullable_to_non_nullable
              as WallData?,
    ));
  }
}

/// @nodoc

class _$_MapState implements _MapState {
  const _$_MapState(
      {this.image,
      required this.currentScale,
      required this.dragViewOffset,
      required this.mapMode,
      final List<WallData>? walls,
      this.currentWall})
      : _walls = walls;

  @override
  final Image? image;
  @override
  final double currentScale;
  @override
  final Offset dragViewOffset;
  @override
  final MapMode mapMode;
  final List<WallData>? _walls;
  @override
  List<WallData>? get walls {
    final value = _walls;
    if (value == null) return null;
    if (_walls is EqualUnmodifiableListView) return _walls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final WallData? currentWall;

  @override
  String toString() {
    return 'MapState(image: $image, currentScale: $currentScale, dragViewOffset: $dragViewOffset, mapMode: $mapMode, walls: $walls, currentWall: $currentWall)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapState &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.currentScale, currentScale) ||
                other.currentScale == currentScale) &&
            (identical(other.dragViewOffset, dragViewOffset) ||
                other.dragViewOffset == dragViewOffset) &&
            (identical(other.mapMode, mapMode) || other.mapMode == mapMode) &&
            const DeepCollectionEquality().equals(other._walls, _walls) &&
            (identical(other.currentWall, currentWall) ||
                other.currentWall == currentWall));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      image,
      currentScale,
      dragViewOffset,
      mapMode,
      const DeepCollectionEquality().hash(_walls),
      currentWall);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapStateCopyWith<_$_MapState> get copyWith =>
      __$$_MapStateCopyWithImpl<_$_MapState>(this, _$identity);
}

abstract class _MapState implements MapState {
  const factory _MapState(
      {final Image? image,
      required final double currentScale,
      required final Offset dragViewOffset,
      required final MapMode mapMode,
      final List<WallData>? walls,
      final WallData? currentWall}) = _$_MapState;

  @override
  Image? get image;
  @override
  double get currentScale;
  @override
  Offset get dragViewOffset;
  @override
  MapMode get mapMode;
  @override
  List<WallData>? get walls;
  @override
  WallData? get currentWall;
  @override
  @JsonKey(ignore: true)
  _$$_MapStateCopyWith<_$_MapState> get copyWith =>
      throw _privateConstructorUsedError;
}
