// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../model/level.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MusicLevel _$MusicLevelFromJson(Map<String, dynamic> json) {
  return _MusicLevel.fromJson(json);
}

/// @nodoc
mixin _$MusicLevel {
  double get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'const')
  double get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxcombo')
  int get combo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicLevelCopyWith<MusicLevel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicLevelCopyWith<$Res> {
  factory $MusicLevelCopyWith(
          MusicLevel value, $Res Function(MusicLevel) then) =
      _$MusicLevelCopyWithImpl<$Res, MusicLevel>;
  @useResult
  $Res call(
      {double level,
      @JsonKey(name: 'const') double rate,
      @JsonKey(name: 'maxcombo') int combo});
}

/// @nodoc
class _$MusicLevelCopyWithImpl<$Res, $Val extends MusicLevel>
    implements $MusicLevelCopyWith<$Res> {
  _$MusicLevelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? rate = null,
    Object? combo = null,
  }) {
    return _then(_value.copyWith(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      combo: null == combo
          ? _value.combo
          : combo // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MusicLevelCopyWith<$Res>
    implements $MusicLevelCopyWith<$Res> {
  factory _$$_MusicLevelCopyWith(
          _$_MusicLevel value, $Res Function(_$_MusicLevel) then) =
      __$$_MusicLevelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double level,
      @JsonKey(name: 'const') double rate,
      @JsonKey(name: 'maxcombo') int combo});
}

/// @nodoc
class __$$_MusicLevelCopyWithImpl<$Res>
    extends _$MusicLevelCopyWithImpl<$Res, _$_MusicLevel>
    implements _$$_MusicLevelCopyWith<$Res> {
  __$$_MusicLevelCopyWithImpl(
      _$_MusicLevel _value, $Res Function(_$_MusicLevel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? level = null,
    Object? rate = null,
    Object? combo = null,
  }) {
    return _then(_$_MusicLevel(
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
      combo: null == combo
          ? _value.combo
          : combo // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MusicLevel implements _MusicLevel {
  _$_MusicLevel(
      {required this.level,
      @JsonKey(name: 'const') required this.rate,
      @JsonKey(name: 'maxcombo') required this.combo});

  factory _$_MusicLevel.fromJson(Map<String, dynamic> json) =>
      _$$_MusicLevelFromJson(json);

  @override
  final double level;
  @override
  @JsonKey(name: 'const')
  final double rate;
  @override
  @JsonKey(name: 'maxcombo')
  final int combo;

  @override
  String toString() {
    return 'MusicLevel(level: $level, rate: $rate, combo: $combo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MusicLevel &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.combo, combo) || other.combo == combo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, level, rate, combo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MusicLevelCopyWith<_$_MusicLevel> get copyWith =>
      __$$_MusicLevelCopyWithImpl<_$_MusicLevel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MusicLevelToJson(
      this,
    );
  }
}

abstract class _MusicLevel implements MusicLevel {
  factory _MusicLevel(
      {required final double level,
      @JsonKey(name: 'const') required final double rate,
      @JsonKey(name: 'maxcombo') required final int combo}) = _$_MusicLevel;

  factory _MusicLevel.fromJson(Map<String, dynamic> json) =
      _$_MusicLevel.fromJson;

  @override
  double get level;
  @override
  @JsonKey(name: 'const')
  double get rate;
  @override
  @JsonKey(name: 'maxcombo')
  int get combo;
  @override
  @JsonKey(ignore: true)
  _$$_MusicLevelCopyWith<_$_MusicLevel> get copyWith =>
      throw _privateConstructorUsedError;
}
