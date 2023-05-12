import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import '../../domain/usecases/create_user_usecase.dart';
import 'register_event.dart';
import 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc(this._createUser) : super(RegisterState.initial());

  final CreateUser _createUser;

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    yield* event.when(
      emailChanged: (emailStr) async* {
        yield state.copyWith(email: emailStr);
      },
      passwordChanged: (passwordStr) async* {
        yield state.copyWith(password: passwordStr);
      },
      registerWithEmailAndPasswordPressed:
          (String email, String password) async* {
        yield state.copyWith(isSubmitting: true);

        final result = await _createUser.createUser(email, password);
        yield result.fold(
          (failure) => state.copyWith(
            isSubmitting: false,
            failure: some(failure),
          ),
          (user) => state.copyWith(isSubmitting: false),
        );
      },
    );
  }
}
