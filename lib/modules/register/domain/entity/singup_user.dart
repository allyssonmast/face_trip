import 'package:freezed_annotation/freezed_annotation.dart';
part 'singup_user.freezed.dart';

@freezed
class SingupEntity with _$SingupEntity {
  const factory SingupEntity({
    required String name,
    required String email,
    required String password,
  }) = _Singup;
}
