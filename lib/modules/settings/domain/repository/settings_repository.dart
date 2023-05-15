import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';

abstract class SettingsRepository {
  Future<Either<Failure, UserEntity>> getUserData();
  Future<Either<Failure, Unit>> updateUserData(UserEntity user);
  Future<Either<Failure, String>> saveImage(File file);
}
