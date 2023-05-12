import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

import '../repository/create_repository.dart';

abstract class CreateUser {
  Future<Either<Failure, UserEntity>> createUser(String email, String password);
}

@Injectable(as: CreateUser)
class CreateUserImp implements CreateUser {
  final CreateRepository _repository;
  CreateUserImp(this._repository);

  @override
  Future<Either<Failure, UserEntity>> createUser(
      String email, String password) async {
    return await _repository.createUser(email, password);
  }
}
