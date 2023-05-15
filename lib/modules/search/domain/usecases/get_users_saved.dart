import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/modules/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSavedUsersUseCase {
  final SearchRepository _userRepository;

  GetSavedUsersUseCase(this._userRepository);

  Future<List<UserEntity>> call() async {
    return await _userRepository.getSavedUsers();
  }
}
