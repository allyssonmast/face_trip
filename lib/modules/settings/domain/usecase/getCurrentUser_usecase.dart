import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/modules/settings/domain/repository/settings_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentUser {
  final SettingsRepository repository;

  GetCurrentUser(this.repository);

  Future<Either<Failure, UserEntity?>> call() async {
    return repository.getUserData();
  }
}
