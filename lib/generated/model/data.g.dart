// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      bas: json['BAS'] == null
          ? null
          : MusicLevel.fromJson(json['BAS'] as Map<String, dynamic>),
      adv: json['ADV'] == null
          ? null
          : MusicLevel.fromJson(json['ADV'] as Map<String, dynamic>),
      exp: json['EXP'] == null
          ? null
          : MusicLevel.fromJson(json['EXP'] as Map<String, dynamic>),
      mas: json['MAS'] == null
          ? null
          : MusicLevel.fromJson(json['MAS'] as Map<String, dynamic>),
      ult: json['ULT'] == null
          ? null
          : MusicLevel.fromJson(json['ULT'] as Map<String, dynamic>),
      we: json['WE'] == null
          ? null
          : MusicLevel.fromJson(json['WE'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'BAS': instance.bas,
      'ADV': instance.adv,
      'EXP': instance.exp,
      'MAS': instance.mas,
      'ULT': instance.ult,
      'WE': instance.we,
    };
