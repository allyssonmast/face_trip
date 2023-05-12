import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';

import 'package:facetrip/core/error/login/failure.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    required String email,
    required String password,
    required bool isSubmitting,
    required Option<Failure> failure,
  }) = _RegisterState;

  factory RegisterState.initial() => RegisterState(
    email: '',
    password: '',
    isSubmitting: false,
    failure: none(),
  );
}
