import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/modules/register/domain/repository/create_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CreateRepository)
class CreateRepositoryImp implements CreateRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  CreateRepositoryImp(this._firebaseAuth, this._firestore);
  @override
  Future<Either<Failure, User>> createUser(
      String email, String password) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return right(result.user!);
    } on FirebaseAuthException catch (e) {
      return Left( Failure(message: e.message!));
    } catch (e) {
      return Left( Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, void>> saveUser(String email, String name) async {
    try {
      var fireCollection = _firestore.collection('users');

      var userCreated = UserEntity(
        id: _firebaseAuth.currentUser!.uid,
        email: email,
        name: name,
        description: '',
        isTraveled: false,
        url: '',
        listContact: [],
      );

      return Right(await fireCollection
          .doc(_firebaseAuth.currentUser!.uid)
          .set(userCreated.toJson()));
    }on FirebaseAuthException catch (e) {
      return Left( Failure(message: e.message!));
    } catch (e) {
      return Left( Failure.serverError());
    }
  }
}
