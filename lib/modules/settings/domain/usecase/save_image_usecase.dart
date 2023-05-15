import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/settings/domain/repository/settings_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveImageUseCase {
  final SettingsRepository repository;

  SaveImageUseCase(this.repository);

  Future<Either<Failure, String>> call(String imagePath) async {
    return await repository.saveImage(File(imagePath));
  }
}
