import 'package:bloc/bloc.dart';
import 'package:facetrip/modules/login/domain/entities/user.dart';
import 'package:facetrip/modules/settings/domain/usecase/getCurrentUser_usecase.dart';
import 'package:facetrip/modules/settings/domain/usecase/open_camera_usecase.dart';
import 'package:facetrip/modules/settings/domain/usecase/save_image_usecase.dart';
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
  final SaveImageUseCase _saveImageUseCase;
  final OpenCameraUseCase _cameraUseCase;

  SettingsBloc(this._getCurrentUser, this._updateCurrentUser,
      this._saveImageUseCase, this._cameraUseCase)
      : super(const SettingsState()) {
    on<SettingsEvent>((event, emit) async {
      if (event is _GetUser) {
        emit(state.copyWith(status: SettingsStatus.loading));
      }
      if (event is _UpdateUser) {
        String newImage = '';
        if (event.imageFile != '') {
          var urlImage = await _saveImageUseCase(event.imageFile);

          urlImage.fold(
              (l) => emit(state.copyWith(
                  status: SettingsStatus.error,
                  errorMessage: l.message)), (url) {
            newImage = url;
          });
        }
        var userNew = event.user.copyWith(url: newImage);

        var result = await _updateCurrentUser(userNew);
        result.fold(
          (failure) => emit(state.copyWith(
              status: SettingsStatus.error,
              errorMessage: failure.message)),
          (user) => emit(
            state.copyWith(status: SettingsStatus.updated, user: userNew),
          ),
        );
      }
      if (event is _Started) {
        // emit(state.copyWith(status: SettingsStatus.loading));
        var result = await _getCurrentUser();
        result.fold(
          (failure) => emit(state.copyWith(status: SettingsStatus.error,errorMessage: failure.message)),
          (user) => emit(
            state.copyWith(status: SettingsStatus.loaded, user: user),
          ),
        );
      }

      if (event is _SetAvatarUrl) {
        var imageFile = await _cameraUseCase();
        if (imageFile != null) {
          emit(state.copyWith(imageFile: imageFile));
        }
      }
    });
  }
}
