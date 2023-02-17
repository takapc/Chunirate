import 'package:freezed_annotation/freezed_annotation.dart';

part '../generated/model/meta.freezed.dart';
part '../generated/model/meta.g.dart';

@freezed
class Meta with _$Meta {
  factory Meta({
    required String title,
    required String genre,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
