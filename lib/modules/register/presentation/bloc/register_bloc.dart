import 'package:facetrip/modules/register/domain/usecases/save_created_user_usecase.dart';
import 'package:facetrip/modules/register/domain/usecases/set_auth_values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/create_user_usecase.dart';
import 'register_event.dart';
import 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final CreateUser _createUser;
  final SaveCreatedUserUseCase _saveCreatedUserUseCase;
  final SetUserValues _setUserValues;
  RegisterBloc(
      this._createUser, this._setUserValues, this._saveCreatedUserUseCase)
      : super(RegisterState.initial()) {
    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      emit(state.copyWith(status: RegisterStatus.submitting));
      try {
        await _createUser
            .createUser(event.email, event.password)
            .then((value) async =>
                await _saveCreatedUserUseCase(event.email, event.name))
            .then((value) async => await _setUserValues.setUser(event.name));

        emit(state.copyWith(status: RegisterStatus.success));
      } catch (e) {
        emit(state.copyWith(status: RegisterStatus.error, error: e.toString()));
      }
    });
  }
}
