import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/create_user_usecase.dart';
import 'register_event.dart';
import 'register_state.dart';

@singleton
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final CreateUser _createUser;
  RegisterBloc(this._createUser) : super(RegisterState.initial()) {
    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      emit(state.copyWith(status: RegisterStatus.submitting));
      final result = await _createUser.createUser(event.email, event.password);
      emit(result.fold(
        (failure) => state.copyWith(status: RegisterStatus.error),
        (user) => state.copyWith(status: RegisterStatus.success),
      ));
    });
  }
}
