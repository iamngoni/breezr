//
//  breezr_flutter
//  app
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forui/forui.dart';

import 'core/configs/colors.dart';
import 'core/models/data/language.dart';
import 'core/state/locale/locale_bloc.dart';
import 'core/utils/services.dart';
import 'l10n/l10n.dart';

class BreezrApp extends StatelessWidget {
  const BreezrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, Language>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'Merlin World',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: AppColors.indigoPrimary,
            scaffoldBackgroundColor: AppColors.lightBackground,
            fontFamily: '',
            appBarTheme: const AppBarTheme(
              color: AppColors.lightBackground,
              elevation: 0,
              iconTheme: IconThemeData(color: AppColors.black),
            ),
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(state.code),
          builder:
              (context, child) =>
                  FTheme(data: FThemes.zinc.light, child: child!),
          routeInformationParser: $routeParser,
          routerDelegate: $routerDelegate,
        );
      },
    );
  }
}
