part of 'contact_details_bloc.dart';

@freezed
class ContactDetailsEvent with _$ContactDetailsEvent {
  const factory ContactDetailsEvent.started() = _Started;
  const factory ContactDetailsEvent.updateContact(List<String> listContacts) =
      _UpdateContact;
  const factory ContactDetailsEvent.getContactTrips() = _GetContactTrips;
}
