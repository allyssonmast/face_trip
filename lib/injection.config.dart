// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import 'core/config/firebase_modules_injectable.dart' as _i37;
import 'core/config/shered_preferences.dart' as _i38;
import 'core/config/user_server.dart' as _i14;
import 'modules/contact_details/presentation/bloc/contact_details_bloc.dart'
    as _i3;
import 'modules/home/data/repositories/contact_repositoy_imp.dart' as _i19;
import 'modules/home/domain/repositories/contact_repository.dart' as _i18;
import 'modules/home/domain/usecases/getcontacts_usecase.dart' as _i23;
import 'modules/home/presentation/bloc/home_bloc.dart' as _i25;
import 'modules/login/data/repositories/auth_repository_impl.dart' as _i16;
import 'modules/login/domain/repositories/auth_repository.dart' as _i15;
import 'modules/login/domain/usecases/auth_use_case.dart' as _i17;
import 'modules/login/presentation/bloc/login_bloc.dart' as _i26;
import 'modules/register/data/repository.dart' as _i21;
import 'modules/register/domain/repository/create_repository.dart' as _i20;
import 'modules/register/domain/usecases/create_user_usecase.dart' as _i22;
import 'modules/register/domain/usecases/save_created_user_usecase.dart'
    as _i27;
import 'modules/register/domain/usecases/set_auth_values.dart' as _i9;
import 'modules/register/presentation/bloc/register_bloc.dart' as _i34;
import 'modules/search/data/repository.dart' as _i30;
import 'modules/search/domain/repositories/search_repository.dart' as _i29;
import 'modules/search/domain/usecases/get_users_saved.dart' as _i33;
import 'modules/search/domain/usecases/save_local_user.dart' as _i35;
import 'modules/search/domain/usecases/search_contact_usecase.dart' as _i31;
import 'modules/search/presentation/bloc/search_bloc.dart' as _i36;
import 'modules/settings/data/settings_repository.dart' as _i11;
import 'modules/settings/domain/repository/settings_repository.dart' as _i10;
import 'modules/settings/domain/usecase/getCurrentUser_usecase.dart' as _i24;
import 'modules/settings/domain/usecase/open_camera_usecase.dart' as _i8;
import 'modules/settings/domain/usecase/save_image_usecase.dart' as _i28;
import 'modules/settings/domain/usecase/update_currenteUser.dart' as _i13;
import 'modules/settings/presentation/bloc/settings_bloc.dart' as _i32;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    final registerModule = _$RegisterModule();
    gh.factory<_i3.ContactDetailsBloc>(() => _i3.ContactDetailsBloc());
    gh.lazySingleton<_i4.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i5.FirebaseFirestore>(
        () => firebaseInjectableModule.store);
    gh.lazySingleton<_i6.FirebaseStorage>(
        () => firebaseInjectableModule.storage);
    gh.factory<_i7.ImagePicker>(() => registerModule.imagePicker);
    gh.factory<_i8.OpenCameraUseCase>(
        () => _i8.OpenCameraUseCase(gh<_i7.ImagePicker>()));
    gh.factory<_i9.SetUserValues>(
        () => _i9.SetUserValues(gh<_i4.FirebaseAuth>()));
    gh.factory<_i10.SettingsRepository>(() => _i11.SettingsRepositoryImpl(
          gh<_i4.FirebaseAuth>(),
          gh<_i5.FirebaseFirestore>(),
          gh<_i6.FirebaseStorage>(),
        ));
    await gh.factoryAsync<_i12.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i13.UpdateCurrentUser>(
        () => _i13.UpdateCurrentUser(gh<_i10.SettingsRepository>()));
    gh.lazySingleton<_i14.UserService>(() => _i14.UserService(
          gh<_i4.FirebaseAuth>(),
          gh<_i5.FirebaseFirestore>(),
        ));
    gh.factory<_i15.AuthRepository>(
        () => _i16.AuthRepositoryImpl(gh<_i4.FirebaseAuth>()));
    gh.factory<_i17.AuthUseCase>(
        () => _i17.AuthUseCaseImpl(gh<_i15.AuthRepository>()));
    gh.factory<_i18.ContactRepository>(() => _i19.ContactRepositoryImp(
          gh<_i5.FirebaseFirestore>(),
          gh<_i4.FirebaseAuth>(),
        ));
    gh.factory<_i20.CreateRepository>(() => _i21.CreateRepositoryImp(
          gh<_i4.FirebaseAuth>(),
          gh<_i5.FirebaseFirestore>(),
        ));
    gh.factory<_i22.CreateUser>(
        () => _i22.CreateUserImp(gh<_i20.CreateRepository>()));
    gh.factory<_i23.GetContactsUsecase>(
        () => _i23.GetContactsUsecaseImp(gh<_i18.ContactRepository>()));
    gh.factory<_i24.GetCurrentUser>(
        () => _i24.GetCurrentUser(gh<_i10.SettingsRepository>()));
    gh.lazySingleton<_i25.HomeBloc>(() => _i25.HomeBloc(
          gh<_i23.GetContactsUsecase>(),
          gh<_i14.UserService>(),
        ));
    gh.factory<_i26.LoginBloc>(
        () => _i26.LoginBloc(loginUsecase: gh<_i17.AuthUseCase>()));
    gh.factory<_i27.SaveCreatedUserUseCase>(
        () => _i27.SaveCreatedUserUseCase(gh<_i20.CreateRepository>()));
    gh.factory<_i28.SaveImageUseCase>(
        () => _i28.SaveImageUseCase(gh<_i10.SettingsRepository>()));
    gh.factory<_i29.SearchRepository>(() => _i30.SearchRepositoryImpl(
          gh<_i5.FirebaseFirestore>(),
          gh<_i12.SharedPreferences>(),
        ));
    gh.factory<_i31.SearchUsersUseCase>(
        () => _i31.SearchUsersUseCase(gh<_i29.SearchRepository>()));
    gh.factory<_i32.SettingsBloc>(() => _i32.SettingsBloc(
          gh<_i24.GetCurrentUser>(),
          gh<_i13.UpdateCurrentUser>(),
          gh<_i28.SaveImageUseCase>(),
          gh<_i8.OpenCameraUseCase>(),
        ));
    gh.factory<_i33.GetSavedUsersUseCase>(
        () => _i33.GetSavedUsersUseCase(gh<_i29.SearchRepository>()));
    gh.factory<_i34.RegisterBloc>(() => _i34.RegisterBloc(
          gh<_i22.CreateUser>(),
          gh<_i9.SetUserValues>(),
          gh<_i27.SaveCreatedUserUseCase>(),
        ));
    gh.factory<_i35.SaveUserLocallyUseCase>(
        () => _i35.SaveUserLocallyUseCase(gh<_i29.SearchRepository>()));
    gh.factory<_i36.SearchBloc>(() => _i36.SearchBloc(
          gh<_i33.GetSavedUsersUseCase>(),
          gh<_i35.SaveUserLocallyUseCase>(),
          gh<_i31.SearchUsersUseCase>(),
        ));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i37.FirebaseInjectableModule {}

class _$RegisterModule extends _i38.RegisterModule {}
