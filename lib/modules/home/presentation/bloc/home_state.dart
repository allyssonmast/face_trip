part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  addContact,
  error,
}

extension HomeStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isLoading => this == HomeStatus.loading;
  bool get isLoaded => this == HomeStatus.loaded;
  bool get isError => this == HomeStatus.error;
  bool get isAddContact => this == HomeStatus.addContact;
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    List<UserEntity>? contacts,
    UserEntity? user,
    String? errorMessage,
  }) = _HomeState;
}
