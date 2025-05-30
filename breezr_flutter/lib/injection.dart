import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'core/configs/constants.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureInjection() => getIt.init();
