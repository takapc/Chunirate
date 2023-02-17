// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MusicLevel _$$_MusicLevelFromJson(Map<String, dynamic> json) =>
    _$_MusicLevel(
      level: (json['level'] as num).toDouble(),
      rate: (json['const'] as num).toDouble(),
      combo: json['maxcombo'] as int,
    );

Map<String, dynamic> _$$_MusicLevelToJson(_$_MusicLevel instance) =>
    <String, dynamic>{
      'level': instance.level,
      'const': instance.rate,
      'maxcombo': instance.combo,
    };
