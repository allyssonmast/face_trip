part of 'contact_details_bloc.dart';

enum ContactDetailsStatus {
  initial,
  loading,
  loaded,
  tripsLoaded,
  error,
  updating,
}

extension ContactDetailsStatusX on ContactDetailsStatus {
  bool get isInitial => this == ContactDetailsStatus.initial;
  bool get isLoading => this == ContactDetailsStatus.loading;
  bool get isLoaded => this == ContactDetailsStatus.loaded;
  bool get isTripsLoaded => this == ContactDetailsStatus.tripsLoaded;
  bool get isError => this == ContactDetailsStatus.error;
  bool get isUpdating => this == ContactDetailsStatus.updating;
}

@freezed
class ContactDetailsState with _$ContactDetailsState {
  const factory ContactDetailsState({
    @Default(ContactDetailsStatus.initial) ContactDetailsStatus status,
    ContactEntity? contact,
    String? errorMessage,
  }) = _ContactDetailsState;
}
