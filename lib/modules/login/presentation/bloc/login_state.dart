part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;

  const LoginSuccess({required this.user});

  @override
  List<Object?> get props => [user];

  @override
  String toString() => 'LoginSuccess { user: $user }';
}

class LoginFailure extends LoginState {
  final String errorMessage;

  const LoginFailure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];

  @override
  String toString() => 'LoginFailure { error: $errorMessage }';
}
