import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure({required String message}) = _Failure;

  factory Failure.serverError() => const Failure(message: "Server error");
  factory Failure.clientError() => const Failure(message: "Client error");
}
