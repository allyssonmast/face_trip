// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'modules/home/data/repositories/contact_repositoy_imp.dart' as _i4;
import 'modules/home/domain/repositories/contact_repository.dart' as _i3;
import 'modules/home/domain/usecases/getcontacts_usecase.dart' as _i7;
import 'modules/home/presentation/bloc/home_bloc.dart' as _i8;
import 'modules/login/data/core/firebase_module.dart' as _i17;
import 'modules/login/data/repositories/auth_repository_impl.dart' as _i10;
import 'modules/login/domain/repositories/auth_repository.dart' as _i9;
import 'modules/login/domain/usecases/auth_use_case.dart' as _i11;
import 'modules/login/presentation/bloc/login_bloc.dart' as _i15;
import 'modules/register/data/repository.dart' as _i13;
import 'modules/register/domain/repository/create_repository.dart' as _i12;
import 'modules/register/domain/usecases/create_user_usecase.dart' as _i14;
import 'modules/register/presentation/bloc/register_bloc.dart' as _i16;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.factory<_i3.ContactRepository>(() => _i4.ContactRepositoryImp());
    gh.lazySingleton<_i5.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i6.FirebaseFirestore>(
        () => firebaseInjectableModule.store);
    gh.factory<_i7.GetContactsUsecase>(
        () => _i7.GetContactsUsecaseImp(gh<_i3.ContactRepository>()));
    gh.singleton<_i8.HomeBloc>(_i8.HomeBloc(gh<_i7.GetContactsUsecase>()));
    gh.factory<_i9.AuthRepository>(
        () => _i10.AuthRepositoryImpl(gh<_i5.FirebaseAuth>()));
    gh.factory<_i11.AuthUseCase>(
        () => _i11.AuthUseCaseImpl(gh<_i9.AuthRepository>()));
    gh.factory<_i12.CreateRepository>(
        () => _i13.CreateRepositoryImp(gh<_i5.FirebaseAuth>()));
    gh.factory<_i14.CreateUser>(
        () => _i14.CreateUserImp(gh<_i12.CreateRepository>()));
    gh.singleton<_i15.LoginBloc>(
        _i15.LoginBloc(loginUsecase: gh<_i11.AuthUseCase>()));
    gh.singleton<_i16.RegisterBloc>(_i16.RegisterBloc(gh<_i14.CreateUser>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i17.FirebaseInjectableModule {}
