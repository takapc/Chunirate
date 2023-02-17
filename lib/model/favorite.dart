import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/favorite.freezed.dart';
part '../generated/model/favorite.g.dart';

@freezed
class Favorite with _$Favorite {
  factory Favorite({
    required String title,
    required String diff,
  }) = _Favorite;

  factory Favorite.fromJson(Map<String, dynamic> json) =>
      _$FavoriteFromJson(json);
}
