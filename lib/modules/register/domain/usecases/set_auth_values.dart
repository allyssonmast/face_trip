import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SetUserValues {
  final FirebaseAuth _auth;

  SetUserValues(this._auth);
  Future<Either<Failure,User>> setUser(String name) async {
    try{
      await _auth.currentUser!.updateDisplayName(name);
      await _auth.currentUser!.updatePhotoURL(getUrl());
      return Right(_auth.currentUser!);
    }catch (e){
      return Left(Failure.serverError());
    }
  }
}

String getUrl() =>
    'https://randomuser.me/api/portraits/men/${Random().nextInt(100)}.jpg';
