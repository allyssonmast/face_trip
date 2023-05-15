part of 'search_bloc.dart';

enum SearchStatus {
  initial,
  loading,
  loaded,
  error,
}

extension SearchStatusX on SearchStatus {
  bool get isInitial => this == SearchStatus.initial;
  bool get isLoading => this == SearchStatus.loading;
  bool get isLoaded => this == SearchStatus.loaded;
  bool get isError => this == SearchStatus.error;
}

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(SearchStatus.initial) SearchStatus status,
    @Default([]) List<UserEntity>? contacts,
    String? errorMessage,
  }) = _SearchState;
}
