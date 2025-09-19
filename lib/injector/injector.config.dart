// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/network/api_client.dart' as _i510;
import '../core/storage/auth_storage.dart' as _i983;
import '../features/data/data_sources/remote/auth_remote_data_source.dart' as _i811;
import '../features/data/data_sources/local/auth_local_data_source.dart'
    as _i821;
import '../features/data/data_sources/remote/patient_remote_data_source.dart' as _i220;
import '../features/data/repositories/auth_repository_impl.dart' as _i790;
import '../features/data/repositories/patient_repository_impl.dart' as _i386;
import '../features/domain/repositories/auth_repository.dart' as _i858;
import '../features/domain/repositories/patient_repository.dart' as _i796;
import '../features/domain/usecases/login_usecase.dart' as _i493;
import '../features/domain/usecases/patient_usecase.dart' as _i713;
import '../features/presentation/view_model/login_viewmodel.dart' as _i234;
import '../features/presentation/view_model/patient_viewmodel.dart' as _i918;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i234.LoginViewmodel>(() => _i234.LoginViewmodel());
    gh.factory<_i918.PatientViewmodel>(() => _i918.PatientViewmodel());
    gh.singleton<_i510.ApiClient>(() => _i510.ApiClient());
    gh.singleton<_i983.AuthStorage>(() => _i983.AuthStorage());
    gh.lazySingleton<_i821.AuthLocalDataSource>(
      () => _i821.AuthLocalDataSourceImpl(gh<_i983.AuthStorage>()),
    );
    gh.lazySingleton<_i220.PatientRemoteDataSource>(
      () => _i220.PatientRemoteDataSourceImpl(gh<_i510.ApiClient>()),
    );
    gh.lazySingleton<_i811.AuthRemoteDataSource>(
      () => _i811.AuthRemoteDataSourceImpl(gh<_i510.ApiClient>()),
    );
    gh.lazySingleton<_i858.AuthRepository>(
      () => _i790.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i811.AuthRemoteDataSource>(),
        authLocalDataSource: gh<_i821.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i796.PatientRepository>(
      () => _i386.PatientRepositoryImpl(
        patientRemoteDataSource: gh<_i220.PatientRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i713.PatientUsecase>(
      () => _i713.PatientUsecase(gh<_i796.PatientRepository>()),
    );
    gh.lazySingleton<_i493.LoginUsecase>(
      () => _i493.LoginUsecase(gh<_i858.AuthRepository>()),
    );
    return this;
  }
}
