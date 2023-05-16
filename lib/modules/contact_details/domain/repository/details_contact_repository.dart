import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';

abstract class DetailsContactRepository {
  Future<Either<Failure, bool>> updateContact(List<String> list);
}
