import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/register/domain/repository/create_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveCreatedUserUseCase {
  final CreateRepository _repository;

  SaveCreatedUserUseCase(this._repository);
  Future<Either<Failure, void>> call(email, name) async {
    return await _repository.saveUser(email, name);
  }
}
