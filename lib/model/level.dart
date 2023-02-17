import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/level.freezed.dart';
part '../generated/model/level.g.dart';

@freezed
class MusicLevel with _$MusicLevel {
  factory MusicLevel({
    required double level,
    @JsonKey(name: 'const') required double rate,
    @JsonKey(name: 'maxcombo') required int combo,
  }) = _MusicLevel;

  factory MusicLevel.fromJson(Map<String, dynamic> json) =>
      _$MusicLevelFromJson(json);
}
