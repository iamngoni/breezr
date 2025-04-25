//
//  breezr_flutter
//  package
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

@singleton
class PackageService {
  static PackageService? _instance;
  static PackageInfo? _packageInfo;

  @factoryMethod
  static Future<PackageService> getInstance() async {
    _instance ??= PackageService();

    _packageInfo ??= await PackageInfo.fromPlatform();

    return _instance!;
  }

  String getBuildVersion() {
    final String platformVersion = _packageInfo?.version ?? '';
    final String buildNumber = _packageInfo?.buildNumber ?? '';
    final String appVersion = '$platformVersion.$buildNumber';
    return appVersion;
  }
}
