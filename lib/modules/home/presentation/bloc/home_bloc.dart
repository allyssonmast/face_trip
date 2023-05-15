import 'package:bloc/bloc.dart';
import 'package:facetrip/modules/home/domain/entities/contact.dart';
import 'package:facetrip/modules/home/domain/usecases/getcontacts_usecase.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetContactsUsecase _getContactsUsecase;

  HomeBloc(this._getContactsUsecase) : super(const HomeState()) {
    on<HomeEvent>((event, emit) async {
      if (event is _Started) {
        emit(state.copyWith(status: HomeStatus.loading));
        var result = await _getContactsUsecase();

        result.fold(
          (faiulure) => emit(state.copyWith(
              status: HomeStatus.error, errorMessage: 'HomeStatus.error')),
          (contacts) => emit(
              state.copyWith(status: HomeStatus.loaded, contacts: contacts)),
        );
      }

      if (event is _AddContacts) {
        emit(state.copyWith(status: HomeStatus.addContact));
      }
    });
  }
}
