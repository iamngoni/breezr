//
//  breezr_flutter
//  route
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

class AppRoute {
  AppRoute(this.location, {this.queryParameters = const {}});
  final String location;
  final Map<String, String> queryParameters;

  @override
  String toString() {
    return location;
  }
}
