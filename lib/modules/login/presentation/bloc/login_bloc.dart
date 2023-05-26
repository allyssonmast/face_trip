import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/usecases/auth_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase loginUsecase;

  LoginBloc({required this.loginUsecase}) : super(LoginInitial()) {
    on<LoginWithEmailButtonPressed>(_mapLoginWithEmailButtonPressedToState);
  }

  _mapLoginWithEmailButtonPressedToState(event, emit) async {
    emit(LoginLoading());

    final Either<Failure, User> result = await loginUsecase
        .loginWithEmailAndPassword(event.email, event.password);

    emit(result.fold(
      (failure) => LoginFailure(errorMessage: failure.message),
      (user) => LoginSuccess(user: user),
    ));
  }

  Stream<LoginState> _mapLoginWithGoogleButtonPressedToState() async* {
    yield LoginLoading();
    final Either<Failure, User> result = await loginUsecase.loginWithGoogle();
    yield result.fold(
      (failure) => LoginFailure(errorMessage: failure.message),
      (user) => LoginSuccess(user: user),
    );
  }

  Stream<LoginState> _mapLoginWithFacebookButtonPressedToState() async* {
    yield LoginLoading();
    final Either<Failure, User> result = await loginUsecase.loginWithFacebook();
    yield result.fold(
      (failure) => LoginFailure(errorMessage: failure.message),
      (user) => LoginSuccess(user: user),
    );
  }

}
