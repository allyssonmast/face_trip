import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../entities/user.dart';
import '../repositories/auth_repository.dart';

abstract class AuthUseCase {
  Future<Either<Failure, User>> loginWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, User>> loginWithFacebook();
  Future<Either<Failure, User>> loginWithGoogle();
  Future<Either<Failure, User>> loginWithPhone(String phoneNumber);
}

@Injectable(as: AuthUseCase)
class AuthUseCaseImpl implements AuthUseCase {
  final AuthRepository _repository;

  AuthUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword(
      String email, String password) {
    return _repository.loginWithEmailAndPassword(email, password);
  }

  @override
  Future<Either<Failure, User>> loginWithFacebook() {
    return _repository.loginWithFacebook();
  }

  @override
  Future<Either<Failure, User>> loginWithGoogle() {
    return _repository.loginWithGoogle();
  }

  @override
  Future<Either<Failure, User>> loginWithPhone(String phoneNumber) {
    return _repository.loginWithPhone(phoneNumber);
  }
}
