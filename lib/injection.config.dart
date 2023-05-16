// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:firebase_storage/firebase_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import 'core/config/firebase_modules_injectable.dart' as _i40;
import 'core/config/shered_preferences.dart' as _i41;
import 'core/config/user_server.dart' as _i13;
import 'modules/contact_details/data/details_contact_repository.dart' as _i23;
import 'modules/contact_details/domain/repository/details_contact_repository.dart'
    as _i22;
import 'modules/contact_details/domain/usecases/update_user_usecase.dart'
    as _i34;
import 'modules/contact_details/presentation/bloc/contact_details_bloc.dart'
    as _i35;
import 'modules/home/data/repositories/contact_repositoy_imp.dart' as _i18;
import 'modules/home/domain/repositories/contact_repository.dart' as _i17;
import 'modules/home/domain/usecases/getcontacts_usecase.dart' as _i24;
import 'modules/home/presentation/bloc/home_bloc.dart' as _i26;
import 'modules/login/data/repositories/auth_repository_impl.dart' as _i15;
import 'modules/login/domain/repositories/auth_repository.dart' as _i14;
import 'modules/login/domain/usecases/auth_use_case.dart' as _i16;
import 'modules/login/presentation/bloc/login_bloc.dart' as _i27;
import 'modules/register/data/repository.dart' as _i20;
import 'modules/register/domain/repository/create_repository.dart' as _i19;
import 'modules/register/domain/usecases/create_user_usecase.dart' as _i21;
import 'modules/register/domain/usecases/save_created_user_usecase.dart'
    as _i28;
import 'modules/register/domain/usecases/set_auth_values.dart' as _i8;
import 'modules/register/presentation/bloc/register_bloc.dart' as _i37;
import 'modules/search/data/repository.dart' as _i31;
import 'modules/search/domain/repositories/search_repository.dart' as _i30;
import 'modules/search/domain/usecases/get_users_saved.dart' as _i36;
import 'modules/search/domain/usecases/save_local_user.dart' as _i38;
import 'modules/search/domain/usecases/search_contact_usecase.dart' as _i32;
import 'modules/search/presentation/bloc/search_bloc.dart' as _i39;
import 'modules/settings/data/settings_repository.dart' as _i10;
import 'modules/settings/domain/repository/settings_repository.dart' as _i9;
import 'modules/settings/domain/usecase/getCurrentUser_usecase.dart' as _i25;
import 'modules/settings/domain/usecase/open_camera_usecase.dart' as _i7;
import 'modules/settings/domain/usecase/save_image_usecase.dart' as _i29;
import 'modules/settings/domain/usecase/update_currenteUser.dart' as _i12;
import 'modules/settings/presentation/bloc/settings_bloc.dart' as _i33;

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
    gh.lazySingleton<_i3.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i4.FirebaseFirestore>(
        () => firebaseInjectableModule.store);
    gh.lazySingleton<_i5.FirebaseStorage>(
        () => firebaseInjectableModule.storage);
    gh.factory<_i6.ImagePicker>(() => registerModule.imagePicker);
    gh.factory<_i7.OpenCameraUseCase>(
        () => _i7.OpenCameraUseCase(gh<_i6.ImagePicker>()));
    gh.factory<_i8.SetUserValues>(
        () => _i8.SetUserValues(gh<_i3.FirebaseAuth>()));
    gh.factory<_i9.SettingsRepository>(() => _i10.SettingsRepositoryImpl(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
          gh<_i5.FirebaseStorage>(),
        ));
    await gh.factoryAsync<_i11.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i12.UpdateCurrentUser>(
        () => _i12.UpdateCurrentUser(gh<_i9.SettingsRepository>()));
    gh.lazySingleton<_i13.UserService>(() => _i13.UserService(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i14.AuthRepository>(
        () => _i15.AuthRepositoryImpl(gh<_i3.FirebaseAuth>()));
    gh.factory<_i16.AuthUseCase>(
        () => _i16.AuthUseCaseImpl(gh<_i14.AuthRepository>()));
    gh.factory<_i17.ContactRepository>(() => _i18.ContactRepositoryImp(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i19.CreateRepository>(() => _i20.CreateRepositoryImp(
          gh<_i3.FirebaseAuth>(),
          gh<_i4.FirebaseFirestore>(),
        ));
    gh.factory<_i21.CreateUser>(
        () => _i21.CreateUserImp(gh<_i19.CreateRepository>()));
    gh.factory<_i22.DetailsContactRepository>(
        () => _i23.DetailsContactRepositoryImpl(
              gh<_i4.FirebaseFirestore>(),
              gh<_i3.FirebaseAuth>(),
            ));
    gh.factory<_i24.GetContactsUsecase>(
        () => _i24.GetContactsUsecaseImp(gh<_i17.ContactRepository>()));
    gh.factory<_i25.GetCurrentUser>(
        () => _i25.GetCurrentUser(gh<_i9.SettingsRepository>()));
    gh.lazySingleton<_i26.HomeBloc>(() => _i26.HomeBloc(
          gh<_i24.GetContactsUsecase>(),
          gh<_i13.UserService>(),
        ));
    gh.factory<_i27.LoginBloc>(
        () => _i27.LoginBloc(loginUsecase: gh<_i16.AuthUseCase>()));
    gh.factory<_i28.SaveCreatedUserUseCase>(
        () => _i28.SaveCreatedUserUseCase(gh<_i19.CreateRepository>()));
    gh.factory<_i29.SaveImageUseCase>(
        () => _i29.SaveImageUseCase(gh<_i9.SettingsRepository>()));
    gh.factory<_i30.SearchRepository>(() => _i31.SearchRepositoryImpl(
          gh<_i4.FirebaseFirestore>(),
          gh<_i11.SharedPreferences>(),
        ));
    gh.factory<_i32.SearchUsersUseCase>(
        () => _i32.SearchUsersUseCase(gh<_i30.SearchRepository>()));
    gh.factory<_i33.SettingsBloc>(() => _i33.SettingsBloc(
          gh<_i25.GetCurrentUser>(),
          gh<_i12.UpdateCurrentUser>(),
          gh<_i29.SaveImageUseCase>(),
          gh<_i7.OpenCameraUseCase>(),
        ));
    gh.factory<_i34.UpdateContactsUseCase>(() => _i34.UpdateContactsUseCase(
        repository: gh<_i22.DetailsContactRepository>()));
    gh.factory<_i35.ContactDetailsBloc>(
        () => _i35.ContactDetailsBloc(gh<_i34.UpdateContactsUseCase>()));
    gh.factory<_i36.GetSavedUsersUseCase>(
        () => _i36.GetSavedUsersUseCase(gh<_i30.SearchRepository>()));
    gh.factory<_i37.RegisterBloc>(() => _i37.RegisterBloc(
          gh<_i21.CreateUser>(),
          gh<_i8.SetUserValues>(),
          gh<_i28.SaveCreatedUserUseCase>(),
        ));
    gh.factory<_i38.SaveUserLocallyUseCase>(
        () => _i38.SaveUserLocallyUseCase(gh<_i30.SearchRepository>()));
    gh.factory<_i39.SearchBloc>(() => _i39.SearchBloc(
          gh<_i36.GetSavedUsersUseCase>(),
          gh<_i38.SaveUserLocallyUseCase>(),
          gh<_i32.SearchUsersUseCase>(),
        ));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i40.FirebaseInjectableModule {}

class _$RegisterModule extends _i41.RegisterModule {}
