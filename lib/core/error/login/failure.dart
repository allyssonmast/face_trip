import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.serverError() = ServerFailure;
  const factory Failure.networkError() = NetworkFailure;
  const factory Failure.invalidEmail() = InvalidEmailFailure;
  const factory Failure.invalidPassword() = InvalidPasswordFailure;
  const factory Failure.unexpectedError() = UnexpectedFailure;
}
