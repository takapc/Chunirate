import 'package:freezed_annotation/freezed_annotation.dart';

import 'level.dart';

part '../generated/model/data.freezed.dart';
part '../generated/model/data.g.dart';

@freezed
class Data with _$Data {
  factory Data({
    @JsonKey(name: 'BAS') MusicLevel? bas,
    @JsonKey(name: 'ADV') MusicLevel? adv,
    @JsonKey(name: 'EXP') MusicLevel? exp,
    @JsonKey(name: 'MAS') MusicLevel? mas,
    @JsonKey(name: 'ULT') MusicLevel? ult,
    @JsonKey(name: 'WE') MusicLevel? we,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
