// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api/api_manager.dart' as _i88;
import '../data/data_sources/online_data_source/auth_data_source.dart' as _i207;
import '../data/data_sources_impl/auth_data_source_impl.dart' as _i1020;
import '../data/repos/auth_repo_impl.dart' as _i69;
import '../domain/repos/auth_repo.dart' as _i425;
import '../domain/use_cases/login_use_case.dart' as _i839;
import '../domain/use_cases/register_use_case.dart' as _i293;
import '../ui/screens/auth/login/cubit/login_view_model.dart' as _i216;
import '../ui/screens/auth/register/cubit/register_view_model.dart' as _i951;


extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i88.ApiManager>(() => _i88.ApiManager());
    gh.factory<_i207.AuthDataSource>(
            () => _i1020.AuthDataSourceImpl(gh<_i88.ApiManager>()));
    gh.factory<_i425.AuthRepo>(
            () => _i69.AuthRepoImpl(authDataSource: gh<_i207.AuthDataSource>()));
    gh.factory<_i839.LoginUseCase>(
            () => _i839.LoginUseCase(authRepo: gh<_i425.AuthRepo>()));
    gh.factory<_i293.RegisterUseCase>(
            () => _i293.RegisterUseCase(authRepo: gh<_i425.AuthRepo>()));
    gh.factory<_i216.LoginViewModel>(
            () => _i216.LoginViewModel(gh<_i839.LoginUseCase>()));
    gh.factory<_i951.RegisterViewModel>(
            () => _i951.RegisterViewModel(gh<_i293.RegisterUseCase>()));
    return this;
  }
}