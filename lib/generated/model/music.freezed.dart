// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../model/music.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Music _$MusicFromJson(Map<String, dynamic> json) {
  return _Music.fromJson(json);
}

/// @nodoc
mixin _$Music {
  Meta get meta => throw _privateConstructorUsedError;
  Data get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicCopyWith<Music> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicCopyWith<$Res> {
  factory $MusicCopyWith(Music value, $Res Function(Music) then) =
      _$MusicCopyWithImpl<$Res, Music>;
  @useResult
  $Res call({Meta meta, Data data});

  $MetaCopyWith<$Res> get meta;
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class _$MusicCopyWithImpl<$Res, $Val extends Music>
    implements $MusicCopyWith<$Res> {
  _$MusicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res> get meta {
    return $MetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res> get data {
    return $DataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MusicCopyWith<$Res> implements $MusicCopyWith<$Res> {
  factory _$$_MusicCopyWith(_$_Music value, $Res Function(_$_Music) then) =
      __$$_MusicCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Meta meta, Data data});

  @override
  $MetaCopyWith<$Res> get meta;
  @override
  $DataCopyWith<$Res> get data;
}

/// @nodoc
class __$$_MusicCopyWithImpl<$Res> extends _$MusicCopyWithImpl<$Res, _$_Music>
    implements _$$_MusicCopyWith<$Res> {
  __$$_MusicCopyWithImpl(_$_Music _value, $Res Function(_$_Music) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? data = null,
  }) {
    return _then(_$_Music(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Music implements _Music {
  _$_Music({required this.meta, required this.data});

  factory _$_Music.fromJson(Map<String, dynamic> json) =>
      _$$_MusicFromJson(json);

  @override
  final Meta meta;
  @override
  final Data data;

  @override
  String toString() {
    return 'Music(meta: $meta, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Music &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, meta, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MusicCopyWith<_$_Music> get copyWith =>
      __$$_MusicCopyWithImpl<_$_Music>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MusicToJson(
      this,
    );
  }
}

abstract class _Music implements Music {
  factory _Music({required final Meta meta, required final Data data}) =
      _$_Music;

  factory _Music.fromJson(Map<String, dynamic> json) = _$_Music.fromJson;

  @override
  Meta get meta;
  @override
  Data get data;
  @override
  @JsonKey(ignore: true)
  _$$_MusicCopyWith<_$_Music> get copyWith =>
      throw _privateConstructorUsedError;
}
