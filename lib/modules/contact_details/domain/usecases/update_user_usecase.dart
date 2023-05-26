import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/contact_details/domain/repository/details_contact_repository.dart';
import 'package:facetrip/modules/trip/domain/entities/trip.dart';

import 'package:injectable/injectable.dart';

@injectable
class UpdateContactsUseCase {
  final DetailsContactRepository repository;

  UpdateContactsUseCase({required this.repository});

  Future<Either<Failure, bool>> call(List<String> newContacts) async {
    return await repository.updateContact(newContacts);
  }

  Future<Either<Failure, List<Trip>>> getTrips() async {
    return await repository.getTrips();
  }
}
