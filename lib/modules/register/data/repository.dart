import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/modules/register/domain/repository/create_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CreateRepository)
class CreateRepositoryImp implements CreateRepository {
  final FirebaseAuth _firebaseAuth;

  CreateRepositoryImp(this._firebaseAuth);
  @override
  Future<Either<Failure, UserEntity>> createUser(
      String email, String password) async {
    try {
      final result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = result.user!;
      return right(UserEntity(
        id: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
      ));
    } on FirebaseAuthException catch (e) {
      print(e);
      return left(const Failure.networkError());
    } catch (e) {
      return left(const Failure.unexpectedError());
    }
  }
}