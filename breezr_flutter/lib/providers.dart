import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/state/locale/locale_bloc.dart';
import 'injection.dart';

List<BlocProvider> providers = [
  BlocProvider<LocaleBloc>(
    lazy: false,
    create: (_) => getIt<LocaleBloc>()..add(LoadLocale()),
  ),
];
