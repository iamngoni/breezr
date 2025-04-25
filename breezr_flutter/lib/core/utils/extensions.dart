//
//  breezr_flutter
//  extensions
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import '../../routing/route.dart';
import '../../routing/router_delegate.dart';

extension ContextExtensions on BuildContext {
  AppRouterDelegate get _routerDelegate =>
      Router.of(this).routerDelegate as AppRouterDelegate;

  /// Unified go: accepts a route path and optional arguments (used as query parameters)
  void go(String route, {Map<String, dynamic> arguments = const {}}) {
    final queryParams = arguments.map(
      (key, value) => MapEntry(key, value.toString()),
    );
    _routerDelegate.setNewRoutePath(
      AppRoute(route, queryParameters: queryParams),
    );
  }

  /// Replace current page with a new one
  void goToAndReplace(
    String route, {
    Map<String, dynamic> arguments = const {},
  }) {
    final queryParams = arguments.map((k, v) => MapEntry(k, v.toString()));
    _routerDelegate
      ..navigatorKey.currentState?.pop()
      ..setNewRoutePath(AppRoute(route, queryParameters: queryParams));
  }

  /// Clears back stack and navigates to a new route
  void goToAndRemoveUntil(
    String route, {
    Map<String, dynamic> arguments = const {},
  }) {
    final queryParams = arguments.map((k, v) => MapEntry(k, v.toString()));
    final navigator = _routerDelegate.navigatorKey.currentState!;
    while (navigator.canPop()) {
      navigator.pop();
    }
    _routerDelegate.setNewRoutePath(
      AppRoute(route, queryParameters: queryParams),
    );
  }

  void goBack<T>({T? value}) {
    Navigator.of(this).pop<T>(value);
  }

  void notify(String message, {bool isError = false}) {
    throw Exception('eeee');
  }
}
