import 'package:dartz/dartz.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/login/failure.dart';
import '../../domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      final user = result.user!;
      print(user.uid);
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

  @override
  Future<Either<Failure, UserEntity>> loginWithFacebook() {
    // TODO: Implementar login com Facebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() {
    // TODO: Implementar login com Google
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithPhone(String phoneNumber) {
    // TODO: Implementar login com telefone
    throw UnimplementedError();
  }
}
