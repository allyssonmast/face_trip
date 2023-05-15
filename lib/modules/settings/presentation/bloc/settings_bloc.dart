import 'package:bloc/bloc.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/modules/settings/domain/usecase/getCurrentUser_usecase.dart';
import 'package:facetrip/modules/settings/domain/usecase/update_currenteUser.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetCurrentUser _getCurrentUser;
  final UpdateCurrentUser _updateCurrentUser;
  SettingsBloc(this._getCurrentUser, this._updateCurrentUser)
      : super(const SettingsState()) {
    on<SettingsEvent>((event, emit) async {
      if (event is _GetUser) {
        emit(state.copyWith(status: SettingsStatus.loading));
      }
      if (event is _UpdateUser) {}
      if (event is _Started) {
        // emit(state.copyWith(status: SettingsStatus.loading));
        var result = await _getCurrentUser();
        result.fold(
          (failure) => emit(state.copyWith(status: SettingsStatus.error)),
          (user) => emit(
            state.copyWith(status: SettingsStatus.loaded, user: user),
          ),
        );
      }
    });
  }
}
