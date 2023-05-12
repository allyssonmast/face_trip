part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

extension HomeStatusX on HomeStatus {
  bool get isInitial => this == HomeStatus.initial;
  bool get isLoading => this == HomeStatus.loading;
  bool get isLoaded => this == HomeStatus.loaded;
  bool get isError => this == HomeStatus.error;
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    List<ContactEntity>? contacts,
    String? errorMessage,
  }) = _HomeState;
}
