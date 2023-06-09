import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/home/domain/repositories/contact_repository.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ContactRepository)
class ContactRepositoryImp implements ContactRepository {
  final FirebaseFirestore _store;
  final FirebaseAuth _auth;

  ContactRepositoryImp(this._store, this._auth);
  @override
  Future<Either<Failure, List<UserEntity>>> call(List<String> listEmail) async {
    try {
      var result = await _store
          .collection('users')
          .where('email', whereIn: listEmail)
          .get();

      var list = result.docs.map((e) => UserEntity.fromJson(e.data())).toList();

      return Right(list);
    } on FirebaseException catch (_, e) {
      return  Left(Failure(message: e.toString()));
    } catch (e){
      return Left(Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, bool>> addContact(UserEntity contact) async {
    try {
      await _store
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('contacts')
          .add(contact.toJson());

      return const Right(true);
    }  on FirebaseException catch (_, e) {
      return  Left(Failure(message: e.toString()));
    } catch (e){
      return Left(Failure.serverError());
    }
  }
}
