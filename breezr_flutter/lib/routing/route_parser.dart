//
//  breezr_flutter
//  route_parser
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

import 'package:flutter/material.dart';

import 'route.dart';

class RouteParser extends RouteInformationParser<AppRoute> {
  @override
  Future<AppRoute> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = routeInformation.uri;
    return AppRoute(uri.path, queryParameters: uri.queryParameters);
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoute configuration) {
    final uri = Uri(
      path: configuration.location,
      queryParameters: configuration.queryParameters,
    );
    return RouteInformation(uri: uri);
  }
}
