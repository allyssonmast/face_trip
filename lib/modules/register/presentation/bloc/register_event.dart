import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.freezed.dart';

@freezed
abstract class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.emailChanged(String emailStr) = EmailChanged;
  const factory RegisterEvent.passwordChanged(String passwordStr) = PasswordChanged;
  const factory RegisterEvent.registerWithEmailAndPasswordPressed(String email,String password) = RegisterWithEmailAndPasswordPressed;
}
