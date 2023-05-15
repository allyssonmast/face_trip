part of 'contact_details_bloc.dart';

@freezed
class ContactDetailsEvent with _$ContactDetailsEvent {
  const factory ContactDetailsEvent.started() = _Started;
}