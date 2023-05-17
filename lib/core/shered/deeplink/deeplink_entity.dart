import 'package:freezed_annotation/freezed_annotation.dart';

part 'deeplink_entity.freezed.dart';
part 'deeplink_entity.g.dart';

@freezed
class DeepLinkEntity with _$DeepLinkEntity {
  const factory DeepLinkEntity({
    required String title,
    required String body,
    required String id,
    required String? url,
  }) = _DeepLinkEntity;

  factory DeepLinkEntity.fromJson(Map<String, Object?> json) =>
      _$DeepLinkEntityFromJson(json);
}
