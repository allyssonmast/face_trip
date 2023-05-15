import 'package:dartz/dartz.dart';
import 'package:facetrip/modules/home/domain/repositories/contact_repository.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/login/failure.dart';

abstract class GetContactsUsecase {
  Future<Either<Failure, List<UserEntity>>> call(List<String> listEmail);
}

@Injectable(as: GetContactsUsecase)
class GetContactsUsecaseImp implements GetContactsUsecase {
  final ContactRepository _repository;

  GetContactsUsecaseImp(this._repository);
  @override
  Future<Either<Failure, List<UserEntity>>> call(List<String> listEmail) async {
    return await _repository(listEmail);
  }
}
