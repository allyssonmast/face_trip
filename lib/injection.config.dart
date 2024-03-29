// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import 'core/config/firebase_modules_injectable.dart' as _i41;
import 'core/config/shered_preferences.dart' as _i42;
import 'core/config/user_server.dart' as _i14;
import 'core/shered/deeplink/deeplink_server.dart' as _i3;
import 'modules/contact_details/data/details_contact_repository.dart' as _i24;
import 'modules/contact_details/domain/repository/details_contact_repository.dart'
    as _i23;
import 'modules/contact_details/domain/usecases/update_user_usecase.dart'
    as _i35;
import 'modules/contact_details/presentation/bloc/contact_details_bloc.dart'
    as _i36;
import 'modules/home/data/repositories/contact_repositoy_imp.dart' as _i19;
import 'modules/home/domain/repositories/contact_repository.dart' as _i18;
import 'modules/home/domain/usecases/getcontacts_usecase.dart' as _i25;
import 'modules/home/presentation/bloc/home_bloc.dart' as _i27;
import 'modules/login/data/repositories/auth_repository_impl.dart' as _i16;
import 'modules/login/domain/repositories/auth_repository.dart' as _i15;
import 'modules/login/domain/usecases/auth_use_case.dart' as _i17;
import 'modules/login/presentation/bloc/login_bloc.dart' as _i28;
import 'modules/register/data/repository.dart' as _i21;
import 'modules/register/domain/repository/create_repository.dart' as _i20;
import 'modules/register/domain/usecases/create_user_usecase.dart' as _i22;
import 'modules/register/domain/usecases/save_created_user_usecase.dart'
    as _i29;
import 'modules/register/domain/usecases/set_auth_values.dart' as _i9;
import 'modules/register/presentation/bloc/register_bloc.dart' as _i38;
import 'modules/search/data/repository.dart' as _i32;
import 'modules/search/domain/repositories/search_repository.dart' as _i31;
import 'modules/search/domain/usecases/get_users_saved.dart' as _i37;
import 'modules/search/domain/usecases/save_local_user.dart' as _i39;
import 'modules/search/domain/usecases/search_contact_usecase.dart' as _i33;
import 'modules/search/presentation/bloc/search_bloc.dart' as _i40;
import 'modules/settings/data/settings_repository.dart' as _i11;
import 'modules/settings/domain/repository/settings_repository.dart' as _i10;
import 'modules/settings/domain/usecase/getCurrentUser_usecase.dart' as _i26;
import 'modules/settings/domain/usecase/open_camera_usecase.dart' as _i8;
import 'modules/settings/domain/usecase/save_image_usecase.dart' as _i30;
import 'modules/settings/domain/usecase/update_currenteUser.dart' as _i13;
import 'modules/settings/presentation/bloc/settings_bloc.dart' as _i34;

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
    gh.factory<_i3.DeepLinkServer>(() => _i3.DeepLinkServer());
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
    gh.factory<_i23.DetailsContactRepository>(
        () => _i24.DetailsContactRepositoryImpl(
              gh<_i5.FirebaseFirestore>(),
              gh<_i4.FirebaseAuth>(),
            ));
    gh.factory<_i25.GetContactsUsecase>(
        () => _i25.GetContactsUsecaseImp(gh<_i18.ContactRepository>()));
    gh.factory<_i26.GetCurrentUser>(
        () => _i26.GetCurrentUser(gh<_i10.SettingsRepository>()));
    gh.lazySingleton<_i27.HomeBloc>(
        () => _i27.HomeBloc(gh<_i25.GetContactsUsecase>()));
    gh.factory<_i28.LoginBloc>(
        () => _i28.LoginBloc(loginUsecase: gh<_i17.AuthUseCase>()));
    gh.factory<_i29.SaveCreatedUserUseCase>(
        () => _i29.SaveCreatedUserUseCase(gh<_i20.CreateRepository>()));
    gh.factory<_i30.SaveImageUseCase>(
        () => _i30.SaveImageUseCase(gh<_i10.SettingsRepository>()));
    gh.factory<_i31.SearchRepository>(() => _i32.SearchRepositoryImpl(
          gh<_i5.FirebaseFirestore>(),
          gh<_i12.SharedPreferences>(),
        ));
    gh.factory<_i33.SearchUsersUseCase>(
        () => _i33.SearchUsersUseCase(gh<_i31.SearchRepository>()));
    gh.factory<_i34.SettingsBloc>(() => _i34.SettingsBloc(
          gh<_i26.GetCurrentUser>(),
          gh<_i13.UpdateCurrentUser>(),
          gh<_i30.SaveImageUseCase>(),
          gh<_i8.OpenCameraUseCase>(),
        ));
    gh.factory<_i35.UpdateContactsUseCase>(() => _i35.UpdateContactsUseCase(
        repository: gh<_i23.DetailsContactRepository>()));
    gh.factory<_i36.ContactDetailsBloc>(() => _i36.ContactDetailsBloc(
          gh<_i35.UpdateContactsUseCase>(),
          gh<_i3.DeepLinkServer>(),
        ));
    gh.factory<_i37.GetSavedUsersUseCase>(
        () => _i37.GetSavedUsersUseCase(gh<_i31.SearchRepository>()));
    gh.factory<_i38.RegisterBloc>(() => _i38.RegisterBloc(
          gh<_i22.CreateUser>(),
          gh<_i9.SetUserValues>(),
          gh<_i29.SaveCreatedUserUseCase>(),
        ));
    gh.factory<_i39.SaveUserLocallyUseCase>(
        () => _i39.SaveUserLocallyUseCase(gh<_i31.SearchRepository>()));
    gh.factory<_i40.SearchBloc>(() => _i40.SearchBloc(
          gh<_i37.GetSavedUsersUseCase>(),
          gh<_i39.SaveUserLocallyUseCase>(),
          gh<_i33.SearchUsersUseCase>(),
        ));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i41.FirebaseInjectableModule {}

class _$RegisterModule extends _i42.RegisterModule {}
