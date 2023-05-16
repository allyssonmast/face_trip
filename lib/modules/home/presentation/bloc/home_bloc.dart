import 'package:bloc/bloc.dart';
import 'package:facetrip/modules/home/domain/usecases/getcontacts_usecase.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@lazySingleton
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetContactsUsecase _getContactsUsecase;

  HomeBloc(this._getContactsUsecase) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      if (event is _Started) {
        emit(state.copyWith(user: event.userEntity));
        if (event.userEntity.listContact.isEmpty) {
          emit(state.copyWith(status: HomeStatus.loaded, contacts: []));
          return;
        }

        var result = await _getContactsUsecase(event.userEntity.listContact);

        result.fold(
          (faiulure) => emit(state.copyWith(
              status: HomeStatus.error, errorMessage: 'HomeStatus.error')),
          (contacts) => emit(state.copyWith(
              status: HomeStatus.loaded,
              contacts: contacts,
              user: event.userEntity)),
        );
      }

      if (event is _AddContacts) {
        emit(state.copyWith(status: HomeStatus.addContact));
      }
    });
  }
}
