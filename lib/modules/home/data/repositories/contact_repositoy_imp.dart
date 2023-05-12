import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/home/domain/repositories/contact_repository.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/contact.dart';

@Injectable(as: ContactRepository)
class ContactRepositoryImp implements ContactRepository {
  @override
  Future<Either<Failure, List<ContactEntity>>> call() async {
    List<ContactEntity> list = [];
    await Future.delayed(const Duration(seconds: 1));
    return right(list);
  }
}
