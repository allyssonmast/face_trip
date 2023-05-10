import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';

import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, UserEntity>> loginWithFacebook();
  Future<Either<Failure, UserEntity>> loginWithGoogle();
  Future<Either<Failure, UserEntity>> loginWithPhone(String phoneNumber);

}
