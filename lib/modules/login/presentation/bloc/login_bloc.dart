import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/usecases/auth_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user.dart';


part 'login_event.dart';
part 'login_state.dart';

@Injectable()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase loginUsecase;

  LoginBloc({
    required this.loginUsecase,
  }) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithEmailButtonPressed) {
      yield* _mapLoginWithEmailButtonPressedToState(event);
    } else if (event is LoginWithGoogleButtonPressed) {
      yield* _mapLoginWithGoogleButtonPressedToState();
    } else if (event is LoginWithFacebookButtonPressed) {
      yield* _mapLoginWithFacebookButtonPressedToState();
    }
  }

  Stream<LoginState> _mapLoginWithEmailButtonPressedToState(
      LoginWithEmailButtonPressed event) async* {
    yield LoginLoading();
    final Either<Failure, UserEntity> result =
    await loginUsecase.loginWithEmailAndPassword(event.email, event.password);
    yield result.fold(
          (failure) => LoginFailure(errorMessage: _mapFailureToMessage(failure)),
          (user) => LoginSuccess(user: user),
    );
  }

  Stream<LoginState> _mapLoginWithGoogleButtonPressedToState() async* {
    yield LoginLoading();
    final Either<Failure, UserEntity> result = await loginUsecase.loginWithGoogle();
    yield result.fold(
          (failure) => LoginFailure(errorMessage: _mapFailureToMessage(failure)),
          (user) => LoginSuccess(user: user),
    );
  }

  Stream<LoginState> _mapLoginWithFacebookButtonPressedToState() async* {
    yield LoginLoading();
    final Either<Failure, UserEntity> result = await loginUsecase.loginWithFacebook();
    yield result.fold(
          (failure) => LoginFailure(errorMessage: _mapFailureToMessage(failure)),
          (user) => LoginSuccess(user: user),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case NetworkFailure:
        return 'Check your network connection';
      case InvalidEmailFailure:
        return 'Invalid Email';
      case InvalidPasswordFailure:
        return 'Invalid Password';
      default:
        return 'Unexpected error';
    }
  }
}
