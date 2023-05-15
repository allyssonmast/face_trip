part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.loadContacts() = _LoadContacts;
  const factory HomeEvent.addContact() = _AddContacts;
}
