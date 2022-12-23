// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wall_painter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WallData {
  Offset get start => throw _privateConstructorUsedError;
  Offset get end => throw _privateConstructorUsedError;
  bool get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WallDataCopyWith<WallData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WallDataCopyWith<$Res> {
  factory $WallDataCopyWith(WallData value, $Res Function(WallData) then) =
      _$WallDataCopyWithImpl<$Res, WallData>;
  @useResult
  $Res call({Offset start, Offset end, bool selected});
}

/// @nodoc
class _$WallDataCopyWithImpl<$Res, $Val extends WallData>
    implements $WallDataCopyWith<$Res> {
  _$WallDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Offset,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Offset,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WallDataCopyWith<$Res> implements $WallDataCopyWith<$Res> {
  factory _$$_WallDataCopyWith(
          _$_WallData value, $Res Function(_$_WallData) then) =
      __$$_WallDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Offset start, Offset end, bool selected});
}

/// @nodoc
class __$$_WallDataCopyWithImpl<$Res>
    extends _$WallDataCopyWithImpl<$Res, _$_WallData>
    implements _$$_WallDataCopyWith<$Res> {
  __$$_WallDataCopyWithImpl(
      _$_WallData _value, $Res Function(_$_WallData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
    Object? selected = null,
  }) {
    return _then(_$_WallData(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as Offset,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as Offset,
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_WallData implements _WallData {
  const _$_WallData(
      {required this.start, required this.end, required this.selected});

  @override
  final Offset start;
  @override
  final Offset end;
  @override
  final bool selected;

  @override
  String toString() {
    return 'WallData(start: $start, end: $end, selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WallData &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WallDataCopyWith<_$_WallData> get copyWith =>
      __$$_WallDataCopyWithImpl<_$_WallData>(this, _$identity);
}

abstract class _WallData implements WallData {
  const factory _WallData(
      {required final Offset start,
      required final Offset end,
      required final bool selected}) = _$_WallData;

  @override
  Offset get start;
  @override
  Offset get end;
  @override
  bool get selected;
  @override
  @JsonKey(ignore: true)
  _$$_WallDataCopyWith<_$_WallData> get copyWith =>
      throw _privateConstructorUsedError;
}
