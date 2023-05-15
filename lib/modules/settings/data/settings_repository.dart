import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/modules/settings/domain/repository/settings_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  SettingsRepositoryImpl(this._auth, this._firestore);

  @override
  Future<Either<Failure, UserEntity>> getUserData() async {
    try {
      final currentUser = _auth.currentUser;

      final userDoc =
          await _firestore.collection('users').doc(currentUser!.uid).get();

      final userEntity = UserEntity.fromJson(userDoc.data()!);

      return Right(userEntity);
    } on FirebaseException catch (e) {
      print(e);
      return const Left(Failure.networkError());
    } catch (e) {
      print(e);
      return const Left(ServerFailure());
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
    } on FirebaseException catch (e) {
      return const Left(Failure.networkError());
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
