import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';

import '../entities/contact.dart';

abstract class ContactRepository {
  Future<Either<Failure, List<ContactEntity>>> call();
}
