// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'modules/login/data/core/firebase_module.dart' as _i12;
import 'modules/login/data/repositories/auth_repository_impl.dart' as _i5;
import 'modules/login/domain/repositories/auth_repository.dart' as _i4;
import 'modules/login/domain/usecases/auth_use_case.dart' as _i6;
import 'modules/login/presentation/bloc/login_bloc.dart' as _i10;
import 'modules/register/data/repository.dart' as _i8;
import 'modules/register/domain/repository/create_repository.dart' as _i7;
import 'modules/register/domain/usecases/create_user_usecase.dart' as _i9;
import 'modules/register/presentation/bloc/register_bloc.dart' as _i11;

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
    gh.lazySingleton<_i3.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.factory<_i4.AuthRepository>(
        () => _i5.AuthRepositoryImpl(gh<_i3.FirebaseAuth>()));
    gh.factory<_i6.AuthUseCase>(
        () => _i6.AuthUseCaseImpl(gh<_i4.AuthRepository>()));
    gh.factory<_i7.CreateRepository>(
        () => _i8.CreateRepositoryImp(gh<_i3.FirebaseAuth>()));
    gh.factory<_i9.CreateUser>(
        () => _i9.CreateUserImp(gh<_i7.CreateRepository>()));
    gh.factory<_i10.LoginBloc>(
        () => _i10.LoginBloc(loginUsecase: gh<_i6.AuthUseCase>()));
    gh.factory<_i11.RegisterBloc>(
        () => _i11.RegisterBloc(gh<_i9.CreateUser>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i12.FirebaseInjectableModule {}
