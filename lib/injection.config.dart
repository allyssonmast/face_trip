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
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import 'core/config/shered_preferences.dart' as _i25;
import 'modules/home/data/repositories/contact_repositoy_imp.dart' as _i11;
import 'modules/home/domain/repositories/contact_repository.dart' as _i10;
import 'modules/home/domain/usecases/getcontacts_usecase.dart' as _i15;
import 'modules/home/presentation/bloc/home_bloc.dart' as _i16;
import 'modules/login/data/core/firebase_module.dart' as _i26;
import 'modules/login/data/repositories/auth_repository_impl.dart' as _i8;
import 'modules/login/domain/repositories/auth_repository.dart' as _i7;
import 'modules/login/domain/usecases/auth_use_case.dart' as _i9;
import 'modules/login/presentation/bloc/login_bloc.dart' as _i17;
import 'modules/register/data/repository.dart' as _i13;
import 'modules/register/domain/repository/create_repository.dart' as _i12;
import 'modules/register/domain/usecases/create_user_usecase.dart' as _i14;
import 'modules/register/domain/usecases/set_auth_values.dart' as _i5;
import 'modules/register/presentation/bloc/register_bloc.dart' as _i18;
import 'modules/search/data/repository.dart' as _i20;
import 'modules/search/domain/repositories/search_repository.dart' as _i19;
import 'modules/search/domain/usecases/get_users_saved.dart' as _i22;
import 'modules/search/domain/usecases/save_local_user.dart' as _i23;
import 'modules/search/domain/usecases/search_contact_usecase.dart' as _i21;
import 'modules/search/presentation/bloc/search_bloc.dart' as _i24;

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
    gh.factory<_i5.SetUserValues>(
        () => _i5.SetUserValues(gh<_i3.FirebaseAuth>()));
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i7.AuthRepository>(
        () => _i8.AuthRepositoryImpl(gh<_i3.FirebaseAuth>()));
    gh.factory<_i9.AuthUseCase>(
        () => _i9.AuthUseCaseImpl(gh<_i7.AuthRepository>()));
    gh.factory<_i10.ContactRepository>(() => _i11.ContactRepositoryImp(
          gh<_i4.FirebaseFirestore>(),
          gh<_i3.FirebaseAuth>(),
        ));
    gh.factory<_i12.CreateRepository>(
        () => _i13.CreateRepositoryImp(gh<_i3.FirebaseAuth>()));
    gh.factory<_i14.CreateUser>(
        () => _i14.CreateUserImp(gh<_i12.CreateRepository>()));
    gh.factory<_i15.GetContactsUsecase>(
        () => _i15.GetContactsUsecaseImp(gh<_i10.ContactRepository>()));
    gh.factory<_i16.HomeBloc>(
        () => _i16.HomeBloc(gh<_i15.GetContactsUsecase>()));
    gh.factory<_i17.LoginBloc>(
        () => _i17.LoginBloc(loginUsecase: gh<_i9.AuthUseCase>()));
    gh.factory<_i18.RegisterBloc>(() => _i18.RegisterBloc(
          gh<_i14.CreateUser>(),
          gh<_i5.SetUserValues>(),
        ));
    gh.factory<_i19.SearchRepository>(() => _i20.SearchRepositoryImpl(
          gh<_i4.FirebaseFirestore>(),
          gh<_i6.SharedPreferences>(),
        ));
    gh.factory<_i21.SearchUsersUseCase>(
        () => _i21.SearchUsersUseCase(gh<_i19.SearchRepository>()));
    gh.factory<_i22.GetSavedUsersUseCase>(
        () => _i22.GetSavedUsersUseCase(gh<_i19.SearchRepository>()));
    gh.factory<_i23.SaveUserLocallyUseCase>(
        () => _i23.SaveUserLocallyUseCase(gh<_i19.SearchRepository>()));
    gh.factory<_i24.SearchBloc>(() => _i24.SearchBloc(
          gh<_i22.GetSavedUsersUseCase>(),
          gh<_i23.SaveUserLocallyUseCase>(),
          gh<_i21.SearchUsersUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i25.RegisterModule {}

class _$FirebaseInjectableModule extends _i26.FirebaseInjectableModule {}
