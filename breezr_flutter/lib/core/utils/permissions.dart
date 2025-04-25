//
//  breezr_flutter
//  permissions
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

import 'package:flutter/services.dart';

class MacPermissions {
  static const _ch = MethodChannel('breezr_permissions');

  static Future<bool> requestNotifications() async =>
      (await _ch.invokeMethod<bool>('requestNotifications')) ?? false;

  static Future<bool> requestAccessibility() async =>
      (await _ch.invokeMethod<bool>('requestAccessibility')) ?? false;

  static Future<void> openFullDiskAccessPane() async =>
      _ch.invokeMethod('openFullDiskAccess');
}
