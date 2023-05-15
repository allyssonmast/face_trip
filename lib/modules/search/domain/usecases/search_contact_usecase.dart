import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/modules/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchUsersUseCase {
  final SearchRepository _searchRepository;

  SearchUsersUseCase(this._searchRepository);

  Future<Either<Failure, List<UserEntity>>> call(String email) async {
    final result = await _searchRepository.searchUsersByEmail(email);

    return result.fold(
      (failure) => Left(failure),
      (users) => Right(users),
    );
  }
}
