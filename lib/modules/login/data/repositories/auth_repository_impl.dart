import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/login/failure.dart';
import '../../domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<Either<Failure, User>> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = result.user!;
      return right(user);
    } on FirebaseAuthException catch (e) {

      return Left( Failure(message: e.message!));
    } catch (e) {
      return Left( Failure.serverError());
    }
  }

  @override
  Future<Either<Failure, User>> loginWithFacebook() {
    // TODO: Implementar login com Facebook
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> loginWithGoogle() {
    // TODO: Implementar login com Google
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> loginWithPhone(String phoneNumber) {
    // TODO: Implementar login com telefone
    throw UnimplementedError();
  }
}
