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
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import 'core/config/shered_preferences.dart' as _i31;
import 'modules/contact_details/presentation/bloc/contact_details_bloc.dart'
    as _i3;
import 'modules/home/data/repositories/contact_repositoy_imp.dart' as _i15;
import 'modules/home/domain/repositories/contact_repository.dart' as _i14;
import 'modules/home/domain/usecases/getcontacts_usecase.dart' as _i19;
import 'modules/home/presentation/bloc/home_bloc.dart' as _i21;
import 'modules/login/data/core/firebase_module.dart' as _i32;
import 'modules/login/data/repositories/auth_repository_impl.dart' as _i12;
import 'modules/login/domain/repositories/auth_repository.dart' as _i11;
import 'modules/login/domain/usecases/auth_use_case.dart' as _i13;
import 'modules/login/presentation/bloc/login_bloc.dart' as _i22;
import 'modules/register/data/repository.dart' as _i17;
import 'modules/register/domain/repository/create_repository.dart' as _i16;
import 'modules/register/domain/usecases/create_user_usecase.dart' as _i18;
import 'modules/register/domain/usecases/set_auth_values.dart' as _i6;
import 'modules/register/presentation/bloc/register_bloc.dart' as _i23;
import 'modules/search/data/repository.dart' as _i25;
import 'modules/search/domain/repositories/search_repository.dart' as _i24;
import 'modules/search/domain/usecases/get_users_saved.dart' as _i28;
import 'modules/search/domain/usecases/save_local_user.dart' as _i29;
import 'modules/search/domain/usecases/search_contact_usecase.dart' as _i26;
import 'modules/search/presentation/bloc/search_bloc.dart' as _i30;
import 'modules/settings/data/settings_repository.dart' as _i8;
import 'modules/settings/domain/repository/settings_repository.dart' as _i7;
import 'modules/settings/domain/usecase/getCurrentUser_usecase.dart' as _i20;
import 'modules/settings/domain/usecase/update_currenteUser.dart' as _i10;
import 'modules/settings/presentation/bloc/settings_bloc.dart' as _i27;

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
    gh.factory<_i6.SetUserValues>(
        () => _i6.SetUserValues(gh<_i4.FirebaseAuth>()));
    gh.factory<_i7.SettingsRepository>(() => _i8.SettingsRepositoryImpl(
          gh<_i4.FirebaseAuth>(),
          gh<_i5.FirebaseFirestore>(),
        ));
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i10.UpdateCurrentUser>(
        () => _i10.UpdateCurrentUser(gh<_i7.SettingsRepository>()));
    gh.factory<_i11.AuthRepository>(
        () => _i12.AuthRepositoryImpl(gh<_i4.FirebaseAuth>()));
    gh.factory<_i13.AuthUseCase>(
        () => _i13.AuthUseCaseImpl(gh<_i11.AuthRepository>()));
    gh.factory<_i14.ContactRepository>(() => _i15.ContactRepositoryImp(
          gh<_i5.FirebaseFirestore>(),
          gh<_i4.FirebaseAuth>(),
        ));
    gh.factory<_i16.CreateRepository>(
        () => _i17.CreateRepositoryImp(gh<_i4.FirebaseAuth>()));
    gh.factory<_i18.CreateUser>(
        () => _i18.CreateUserImp(gh<_i16.CreateRepository>()));
    gh.factory<_i19.GetContactsUsecase>(
        () => _i19.GetContactsUsecaseImp(gh<_i14.ContactRepository>()));
    gh.factory<_i20.GetCurrentUser>(
        () => _i20.GetCurrentUser(gh<_i7.SettingsRepository>()));
    gh.factory<_i21.HomeBloc>(
        () => _i21.HomeBloc(gh<_i19.GetContactsUsecase>()));
    gh.factory<_i22.LoginBloc>(
        () => _i22.LoginBloc(loginUsecase: gh<_i13.AuthUseCase>()));
    gh.factory<_i23.RegisterBloc>(() => _i23.RegisterBloc(
          gh<_i18.CreateUser>(),
          gh<_i6.SetUserValues>(),
        ));
    gh.factory<_i24.SearchRepository>(() => _i25.SearchRepositoryImpl(
          gh<_i5.FirebaseFirestore>(),
          gh<_i9.SharedPreferences>(),
        ));
    gh.factory<_i26.SearchUsersUseCase>(
        () => _i26.SearchUsersUseCase(gh<_i24.SearchRepository>()));
    gh.factory<_i27.SettingsBloc>(() => _i27.SettingsBloc(
          gh<_i20.GetCurrentUser>(),
          gh<_i10.UpdateCurrentUser>(),
        ));
    gh.factory<_i28.GetSavedUsersUseCase>(
        () => _i28.GetSavedUsersUseCase(gh<_i24.SearchRepository>()));
    gh.factory<_i29.SaveUserLocallyUseCase>(
        () => _i29.SaveUserLocallyUseCase(gh<_i24.SearchRepository>()));
    gh.factory<_i30.SearchBloc>(() => _i30.SearchBloc(
          gh<_i28.GetSavedUsersUseCase>(),
          gh<_i29.SaveUserLocallyUseCase>(),
          gh<_i26.SearchUsersUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i31.RegisterModule {}

class _$FirebaseInjectableModule extends _i32.FirebaseInjectableModule {}
