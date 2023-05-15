import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/modules/search/domain/repositories/search_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveUserLocallyUseCase {
  final SearchRepository _userRepository;

  SaveUserLocallyUseCase(this._userRepository);

  Future<void> call(UserEntity user) async {
    await _userRepository.saveUserLocally(user);
  }
}
