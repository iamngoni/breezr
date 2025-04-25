//
//  breezr_flutter
//  services
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

import '../../injection.dart';
import '../../routing/route_parser.dart';
import '../../routing/router_delegate.dart';
import '../services/scheduler.dart';
import '../services/secure_storage.dart';
import '../services/storage.dart';

RouteParser $routeParser = RouteParser();

AppRouterDelegate $routerDelegate = AppRouterDelegate();

SchedulingService get $scheduler => getIt<SchedulingService>();

SecureStorageService get $secureStorage => getIt<SecureStorageService>();

StorageService get $storage => getIt<StorageService>();
