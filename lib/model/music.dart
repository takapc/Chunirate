import 'package:freezed_annotation/freezed_annotation.dart';

import 'data.dart';
import 'meta.dart';

part '../generated/model/music.freezed.dart';
part '../generated/model/music.g.dart';

@freezed
class Music with _$Music {
  factory Music({
    required Meta meta,
    required Data data,
  }) = _Music;

  factory Music.fromJson(Map<String, dynamic> json) => _$MusicFromJson(json);
}
