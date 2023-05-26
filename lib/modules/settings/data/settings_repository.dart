import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/modules/settings/domain/repository/settings_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _firebaseStorage;
  final FirebaseAuth _auth;

  SettingsRepositoryImpl(this._auth, this._firestore, this._firebaseStorage);

  @override
  Future<Either<Failure, UserEntity>> getUserData() async {
    try {
      final currentUser = _auth.currentUser;

      final userDoc =
          await _firestore.collection('users').doc(currentUser!.uid).get();

      final userEntity = UserEntity.fromJson(userDoc.data()!);

      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
      return Left( Failure(message: e.message!));
    } catch (e) {
      return Left( Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateUserData(UserEntity user) async {
    try {
      final currentUser = _auth.currentUser;

      final userDocRef = _firestore.collection('users').doc(currentUser!.uid);

      final userData = user.toJson();

      await userDocRef.update(userData);

      return const Right(unit);
    } on FirebaseAuthException catch (e) {
      return Left( Failure(message: e.message!));
    } catch (e) {
      return Left( Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, String>> saveImage(File file) async {
    final storageRef =
        _firebaseStorage.ref().child('users/${_auth.currentUser!.uid}');
    final uploadTask = storageRef.putFile(file);

    try {
      final snapshot = await uploadTask.whenComplete(() {});
      final imageUrl = await snapshot.ref.getDownloadURL();
      return Right(imageUrl);
    } on FirebaseAuthException catch (e) {
      return Left( Failure(message: e.message!));
    } catch (e) {
      return Left( Failure.serverError());
    }
  }
}
