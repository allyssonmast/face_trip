import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact.freezed.dart';
part 'contact.g.dart';

@freezed
class ContactEntity with _$ContactEntity {
  const factory ContactEntity({
    required String id,
    required String name,
    required String email,
    required String url,
  }) = _ContactEntity;

  factory ContactEntity.fromJson(Map<String, Object?> json) =>
      _$ContactEntityFromJson(json);
}
