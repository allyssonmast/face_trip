import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> loginWithEmailAndPassword(
      String email, String password);
  Future<Either<Failure, User>> loginWithFacebook();
  Future<Either<Failure, User>> loginWithGoogle();
  Future<Either<Failure, User>> loginWithPhone(String phoneNumber);
}
