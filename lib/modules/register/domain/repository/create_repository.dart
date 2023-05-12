import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';

abstract class CreateRepository {
  Future<Either<Failure, UserEntity>> createUser(String email, String password);
}
