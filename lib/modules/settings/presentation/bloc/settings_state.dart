part of 'settings_bloc.dart';

enum SettingsStatus {
  initial,
  loading,
  loaded,
  error,
}

extension SettingsStatusX on SettingsStatus {
  bool get isInitial => this == SettingsStatus.initial;
  bool get isLoading => this == SettingsStatus.loading;
  bool get isLoaded => this == SettingsStatus.loaded;
  bool get isError => this == SettingsStatus.error;
}

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(SettingsStatus.initial) SettingsStatus status,
    UserEntity? user,
    String? errorMessage,
  }) = _SettingsState;
}
