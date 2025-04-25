// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:breezr_flutter/core/services/package.dart' as _i822;
import 'package:breezr_flutter/core/services/scheduler.dart' as _i701;
import 'package:breezr_flutter/core/services/secure_storage.dart' as _i368;
import 'package:breezr_flutter/core/services/storage.dart' as _i106;
import 'package:breezr_flutter/core/state/locale/locale_bloc.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i494.LocaleBloc>(() => _i494.LocaleBloc());
    gh.singletonAsync<_i106.StorageService>(
      () => _i106.StorageService.getInstance(),
    );
    gh.singletonAsync<_i368.SecureStorageService>(
      () => _i368.SecureStorageService.getInstance(),
    );
    gh.singletonAsync<_i822.PackageService>(
      () => _i822.PackageService.getInstance(),
    );
    gh.singletonAsync<_i701.SchedulingService>(
      () => _i701.SchedulingService.getInstance(),
    );
    return this;
  }
}
