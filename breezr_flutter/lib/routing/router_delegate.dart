//
//  breezr_flutter
//  router_delegate
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../app/views/pages/app.dart';
import 'route.dart';

class AppRouterDelegate extends RouterDelegate<AppRoute>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoute> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  AppRoute? _currentPath;

  @override
  AppRoute get currentConfiguration => _currentPath ?? AppRoute('/');

  void _setPath(AppRoute path) {
    if (kDebugMode) {
      debugPrint('Routing: $_currentPath -> $path');
    }
    _currentPath = path;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(AppRoute configuration) async {
    _setPath(configuration);
  }

  @override
  Widget build(BuildContext context) {
    final path = _currentPath?.location ?? '/';
    final params = _currentPath?.queryParameters ?? {};

    final Widget page = switch (path) {
      '/' => const BreezrMainApp(),
      _ => const BreezrMainApp(),
    };

    return Navigator(
      key: navigatorKey,
      pages: [MaterialPage(child: page)],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        return true;
      },
    );
  }
}
