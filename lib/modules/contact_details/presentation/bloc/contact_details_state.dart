part of 'contact_details_bloc.dart';

enum ContactDetailsStatus {
  initial,
  loading,
  loaded,
  tripsLoaded,
  error,
  generatedDeep,
  updating,
}

extension ContactDetailsStatusX on ContactDetailsStatus {
  bool get isInitial => this == ContactDetailsStatus.initial;
  bool get isLoading => this == ContactDetailsStatus.loading;
  bool get isLoaded => this == ContactDetailsStatus.loaded;
  bool get isTripsLoaded => this == ContactDetailsStatus.tripsLoaded;
  bool get isError => this == ContactDetailsStatus.error;
  bool get isUpdating => this == ContactDetailsStatus.updating;
  bool get isGeneratedDeep => this == ContactDetailsStatus.generatedDeep;
}

@freezed
class ContactDetailsState with _$ContactDetailsState {
  const factory ContactDetailsState({
    @Default(ContactDetailsStatus.initial) ContactDetailsStatus status,
    ContactEntity? contact,
    Uri? uri,
    @Default([]) List<Trip> listTrip,
    String? errorMessage,
  }) = _ContactDetailsState;
}
