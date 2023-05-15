import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<UserEntity>>> searchUsersByEmail(String email);
  Future<void> saveUserLocally(UserEntity user);
  Future<List<UserEntity>> getSavedUsers();
}
