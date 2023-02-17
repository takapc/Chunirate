// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of '../../model/data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  @JsonKey(name: 'BAS')
  MusicLevel? get bas => throw _privateConstructorUsedError;
  @JsonKey(name: 'ADV')
  MusicLevel? get adv => throw _privateConstructorUsedError;
  @JsonKey(name: 'EXP')
  MusicLevel? get exp => throw _privateConstructorUsedError;
  @JsonKey(name: 'MAS')
  MusicLevel? get mas => throw _privateConstructorUsedError;
  @JsonKey(name: 'ULT')
  MusicLevel? get ult => throw _privateConstructorUsedError;
  @JsonKey(name: 'WE')
  MusicLevel? get we => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {@JsonKey(name: 'BAS') MusicLevel? bas,
      @JsonKey(name: 'ADV') MusicLevel? adv,
      @JsonKey(name: 'EXP') MusicLevel? exp,
      @JsonKey(name: 'MAS') MusicLevel? mas,
      @JsonKey(name: 'ULT') MusicLevel? ult,
      @JsonKey(name: 'WE') MusicLevel? we});

  $MusicLevelCopyWith<$Res>? get bas;
  $MusicLevelCopyWith<$Res>? get adv;
  $MusicLevelCopyWith<$Res>? get exp;
  $MusicLevelCopyWith<$Res>? get mas;
  $MusicLevelCopyWith<$Res>? get ult;
  $MusicLevelCopyWith<$Res>? get we;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bas = freezed,
    Object? adv = freezed,
    Object? exp = freezed,
    Object? mas = freezed,
    Object? ult = freezed,
    Object? we = freezed,
  }) {
    return _then(_value.copyWith(
      bas: freezed == bas
          ? _value.bas
          : bas // ignore: cast_nullable_to_non_nullable
              as MusicLevel?,
      adv: freezed == adv
          ? _value.adv
          : adv // ignore: cast_nullable_to_non_nullable
              as MusicLevel?,
      exp: freezed == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as MusicLevel?,
      mas: freezed == mas
          ? _value.mas
          : mas // ignore: cast_nullable_to_non_nullable
              as MusicLevel?,
      ult: freezed == ult
          ? _value.ult
          : ult // ignore: cast_nullable_to_non_nullable
              as MusicLevel?,
      we: freezed == we
          ? _value.we
          : we // ignore: cast_nullable_to_non_nullable
              as MusicLevel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicLevelCopyWith<$Res>? get bas {
    if (_value.bas == null) {
      return null;
    }

    return $MusicLevelCopyWith<$Res>(_value.bas!, (value) {
      return _then(_value.copyWith(bas: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicLevelCopyWith<$Res>? get adv {
    if (_value.adv == null) {
      return null;
    }

    return $MusicLevelCopyWith<$Res>(_value.adv!, (value) {
      return _then(_value.copyWith(adv: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicLevelCopyWith<$Res>? get exp {
    if (_value.exp == null) {
      return null;
    }

    return $MusicLevelCopyWith<$Res>(_value.exp!, (value) {
      return _then(_value.copyWith(exp: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicLevelCopyWith<$Res>? get mas {
    if (_value.mas == null) {
      return null;
    }

    return $MusicLevelCopyWith<$Res>(_value.mas!, (value) {
      return _then(_value.copyWith(mas: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicLevelCopyWith<$Res>? get ult {
    if (_value.ult == null) {
      return null;
    }

    return $MusicLevelCopyWith<$Res>(_value.ult!, (value) {
      return _then(_value.copyWith(ult: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MusicLevelCopyWith<$Res>? get we {
    if (_value.we == null) {
      return null;
    }

    return $MusicLevelCopyWith<$Res>(_value.we!, (value) {
      return _then(_value.copyWith(we: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'BAS') MusicLevel? bas,
      @JsonKey(name: 'ADV') MusicLevel? adv,
      @JsonKey(name: 'EXP') MusicLevel? exp,
      @JsonKey(name: 'MAS') MusicLevel? mas,
      @JsonKey(name: 'ULT') MusicLevel? ult,
      @JsonKey(name: 'WE') MusicLevel? we});

  @override
  $MusicLevelCopyWith<$Res>? get bas;
  @override
  $MusicLevelCopyWith<$Res>? get adv;
  @override
  $MusicLevelCopyWith<$Res>? get exp;
  @override
  $MusicLevelCopyWith<$Res>? get mas;
  @override
  $MusicLevelCopyWith<$Res>? get ult;
  @override
  $MusicLevelCopyWith<$Res>? get we;
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bas = freezed,
    Object? adv = freezed,
    Object? exp = freezed,
    Object? mas = freezed,
    Object? ult = freezed,
    Object? we = freezed,
  }) {
    return _then(_$_Data(
      bas: freezed == bas
          ? _value.bas
          : bas // ignore: cast_nullable_to_non_nullable
              as MusicLevel?,
      adv: freezed == adv
          ? _value.adv
          : adv // ignore: cast_nullable_to_non_nullable
              as MusicLevel?,
      exp: freezed == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as MusicLevel?,
      mas: freezed == mas
          ? _value.mas
          : mas // ignore: cast_nullable_to_non_nullable
              as MusicLevel?,
      ult: freezed == ult
          ? _value.ult
          : ult // ignore: cast_nullable_to_non_nullable
              as MusicLevel?,
      we: freezed == we
          ? _value.we
          : we // ignore: cast_nullable_to_non_nullable
              as MusicLevel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  _$_Data(
      {@JsonKey(name: 'BAS') this.bas,
      @JsonKey(name: 'ADV') this.adv,
      @JsonKey(name: 'EXP') this.exp,
      @JsonKey(name: 'MAS') this.mas,
      @JsonKey(name: 'ULT') this.ult,
      @JsonKey(name: 'WE') this.we});

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  @JsonKey(name: 'BAS')
  final MusicLevel? bas;
  @override
  @JsonKey(name: 'ADV')
  final MusicLevel? adv;
  @override
  @JsonKey(name: 'EXP')
  final MusicLevel? exp;
  @override
  @JsonKey(name: 'MAS')
  final MusicLevel? mas;
  @override
  @JsonKey(name: 'ULT')
  final MusicLevel? ult;
  @override
  @JsonKey(name: 'WE')
  final MusicLevel? we;

  @override
  String toString() {
    return 'Data(bas: $bas, adv: $adv, exp: $exp, mas: $mas, ult: $ult, we: $we)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            (identical(other.bas, bas) || other.bas == bas) &&
            (identical(other.adv, adv) || other.adv == adv) &&
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.mas, mas) || other.mas == mas) &&
            (identical(other.ult, ult) || other.ult == ult) &&
            (identical(other.we, we) || other.we == we));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bas, adv, exp, mas, ult, we);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  factory _Data(
      {@JsonKey(name: 'BAS') final MusicLevel? bas,
      @JsonKey(name: 'ADV') final MusicLevel? adv,
      @JsonKey(name: 'EXP') final MusicLevel? exp,
      @JsonKey(name: 'MAS') final MusicLevel? mas,
      @JsonKey(name: 'ULT') final MusicLevel? ult,
      @JsonKey(name: 'WE') final MusicLevel? we}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  @JsonKey(name: 'BAS')
  MusicLevel? get bas;
  @override
  @JsonKey(name: 'ADV')
  MusicLevel? get adv;
  @override
  @JsonKey(name: 'EXP')
  MusicLevel? get exp;
  @override
  @JsonKey(name: 'MAS')
  MusicLevel? get mas;
  @override
  @JsonKey(name: 'ULT')
  MusicLevel? get ult;
  @override
  @JsonKey(name: 'WE')
  MusicLevel? get we;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}
