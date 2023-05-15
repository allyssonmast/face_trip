part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.started() = _Started;
  const factory SettingsEvent.getUser() = _GetUser;
  const factory SettingsEvent.updateUser(UserEntity user) = _UpdateUser;
}
