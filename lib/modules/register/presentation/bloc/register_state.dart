import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';

import 'package:facetrip/core/error/login/failure.dart';

part 'register_state.freezed.dart';

enum RegisterStatus {
  initial,
  submitting,
  success,
  error,
}

extension RegisterStatusX on RegisterStatus {
  bool get isInitial => this == RegisterStatus.initial;
  bool get isSubmitting => this == RegisterStatus.submitting;
  bool get isSuccess => this == RegisterStatus.success;
  bool get isError => this == RegisterStatus.error;
}

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String email,
    @Default('') String password,
    @Default('') String error,
    @Default(RegisterStatus.initial) RegisterStatus status,
  }) = _RegisterState;

  factory RegisterState.initial() => const RegisterState(
        email: '',
        password: '',
      );
}
