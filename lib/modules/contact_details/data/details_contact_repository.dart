import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/contact_details/domain/repository/details_contact_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DetailsContactRepository)
class DetailsContactRepositoryImpl implements DetailsContactRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  DetailsContactRepositoryImpl(this._firestore, this._auth);
  @override
  Future<Either<Failure, bool>> updateContact(List<String> list) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({'listContact': list});
      return const Right(true);
    } catch (e) {
      return  Left(Failure(message: e.toString()));
    }
  }
}
