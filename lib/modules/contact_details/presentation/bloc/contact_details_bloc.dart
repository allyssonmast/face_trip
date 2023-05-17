import 'package:bloc/bloc.dart';
import 'package:facetrip/core/shered/deeplink/deeplink_entity.dart';
import 'package:facetrip/core/shered/deeplink/deeplink_server.dart';
import 'package:facetrip/injection.dart';
import 'package:facetrip/modules/contact_details/domain/usecases/update_user_usecase.dart';
import 'package:facetrip/modules/home/domain/entities/contact.dart';
import 'package:facetrip/modules/home/presentation/bloc/home_bloc.dart';
import 'package:facetrip/modules/trip/domain/entities/trip.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'contact_details_event.dart';
part 'contact_details_state.dart';
part 'contact_details_bloc.freezed.dart';

@injectable
class ContactDetailsBloc
    extends Bloc<ContactDetailsEvent, ContactDetailsState> {
  final UpdateContactsUseCase _updateContactsUseCase;
  final DeepLinkServer _deepLinkServer;

  ContactDetailsBloc(
    this._updateContactsUseCase,
    this._deepLinkServer,
  ) : super(const ContactDetailsState()) {
    on<ContactDetailsEvent>((event, emit) async {
      if (event is _UpdateContact) {
        var result = await _updateContactsUseCase(event.listContacts);
        result.fold(
          (failure) => emit(state.copyWith(
            status: ContactDetailsStatus.error,
            errorMessage: 'Error trying update contact!',
          )),
          (isTrue) {
            var user = getIt<HomeBloc>()
                .state
                .user!
                .copyWith(listContact: event.listContacts);

            getIt<HomeBloc>().add(HomeEvent.started(user));
            emit(state.copyWith(
              status: ContactDetailsStatus.updating,
            ));
          },
        );
      }

      if (event is _Started) {
        var result = await _updateContactsUseCase.getTrips();
        result.fold(
          (failure) => emit(
            state.copyWith(
              status: ContactDetailsStatus.error,
              errorMessage: failure.message,
            ),
          ),
          (list) => emit(state.copyWith(
            status: ContactDetailsStatus.loaded,
            listTrip: list,
          )),
        );
      }

      if (event is _ShereContact) {
        var result = await _deepLinkServer.shareDynamic(event.deepLinkEntity);
        result.fold(
            (failure) => null,
            (uri) => emit(state.copyWith(
                status: ContactDetailsStatus.generatedDeep, uri: uri)));
      }
    });
  }
}
