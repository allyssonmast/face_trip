import 'package:dartz/dartz.dart';
import 'package:facetrip/modules/home/domain/entities/contact.dart';
import 'package:facetrip/modules/home/domain/repositories/contact_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/login/failure.dart';

abstract class GetContactsUsecase {
  Future<Either<Failure, List<ContactEntity>>> call();
}

@Injectable(as: GetContactsUsecase)
class GetContactsUsecaseImp implements GetContactsUsecase {
  final ContactRepository _repository;

  GetContactsUsecaseImp(this._repository);
  @override
  Future<Either<Failure, List<ContactEntity>>> call() async {
    return await _repository();
  }
}
