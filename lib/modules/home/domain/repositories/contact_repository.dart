import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';

abstract class ContactRepository {
  Future<Either<Failure, List<UserEntity>>> call(List<String> listEmail);
  Future<Either<Failure, bool>> addContact(UserEntity contact);
}
