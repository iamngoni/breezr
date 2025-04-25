//
//  breezr_flutter
//  bootstrap
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

import 'core/configs/constants.dart';
import 'core/utils/services.dart';
import 'injection.dart';
import 'providers.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();

  configureInjection();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
    Sentry.captureException(details.exception, stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await getIt.allReady();
  log('All services are ready ✅');

  if ($storage.getFromDisk('current_environment') !=
      AppConstants.currentEnvironment.name) {
    $storage.clearDisk();
    await $secureStorage.clearDisk();

    $storage.saveToDisk(
      'current_environment',
      AppConstants.currentEnvironment.name,
    );
  }

  await SentryFlutter.init(
    (options) {
      options
        ..dsn = AppConstants.sentryDsn
        ..tracesSampleRate = 1.0
        ..environment = AppConstants.currentEnvironment.name
        ..compressPayload = true
        ..sendDefaultPii = true
        ..addIntegration(LoggingIntegration());
    },
    appRunner:
        () async => runApp(
          SentryWidget(
            child: MultiBlocProvider(
              providers: providers,
              child: await builder(),
            ),
          ),
        ),
  );
}
