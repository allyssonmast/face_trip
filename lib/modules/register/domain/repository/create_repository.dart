import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class CreateRepository {
  Future<Either<Failure, User>> createUser(String email, String password);
}
