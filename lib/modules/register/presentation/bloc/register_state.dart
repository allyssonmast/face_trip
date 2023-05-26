import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

enum RegisterStatus {
  initial,
  submitting,
  saveDb,
  setDefault,
  success,
  error,
}

extension RegisterStatusX on RegisterStatus {
  bool get isInitial => this == RegisterStatus.initial;
  bool get isSubmitting => this == RegisterStatus.submitting;
  bool get saveDb => this == RegisterStatus.saveDb;
  bool get setDefault => this == RegisterStatus.setDefault;
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
