import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/trip/domain/entities/trip.dart';

abstract class DetailsContactRepository {
  Future<Either<Failure, bool>> updateContact(List<String> list);
  Future<Either<Failure, List<Trip>>> getTrips();
}
