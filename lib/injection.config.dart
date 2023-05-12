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

import 'modules/login/data/core/firebase_module.dart' as _i8;
import 'modules/login/data/repositories/auth_repository_impl.dart' as _i5;
import 'modules/login/domain/repositories/auth_repository.dart' as _i4;
import 'modules/login/domain/usecases/auth_use_case.dart' as _i6;
import 'modules/login/presentation/bloc/login_bloc.dart' as _i7;

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
    gh.factory<_i7.LoginBloc>(
        () => _i7.LoginBloc(loginUsecase: gh<_i6.AuthUseCase>()));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i8.FirebaseInjectableModule {}
