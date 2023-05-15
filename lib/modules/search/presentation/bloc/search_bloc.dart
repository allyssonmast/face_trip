import 'package:bloc/bloc.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/modules/search/domain/usecases/get_users_saved.dart';
import 'package:facetrip/modules/search/domain/usecases/save_local_user.dart';
import 'package:facetrip/modules/search/domain/usecases/search_contact_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSavedUsersUseCase _getSavedUsersUseCase;
  final SaveUserLocallyUseCase _saveUserLocallyUseCase;
  final SearchUsersUseCase _searchUsersUseCase;

  SearchBloc(this._getSavedUsersUseCase, this._saveUserLocallyUseCase,
      this._searchUsersUseCase)
      : super(const SearchState()) {
    on<SearchEvent>((event, emit) async {
      if (event is _Started) {
        emit(state.copyWith(status: SearchStatus.loading));
        var result = await _getSavedUsersUseCase();
        emit(state.copyWith(contacts: result, status: SearchStatus.loaded));
      }
      if (event is _Search) {
        emit(state.copyWith(status: SearchStatus.loading));
        var result = await _searchUsersUseCase(event.query);

        result.fold(
            (Failure) => emit(state.copyWith(
                  status: SearchStatus.error,
                )),
            (contacts) => emit(state.copyWith(
                contacts: contacts, status: SearchStatus.loaded)));
      }

      if (event is _Save) {
        if (event.userEntity != null) {
          await _saveUserLocallyUseCase(event.userEntity!);
        }
        emit((state.copyWith(status: SearchStatus.initial)));
      }
    });
  }
}
