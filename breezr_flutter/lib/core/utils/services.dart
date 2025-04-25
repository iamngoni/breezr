//
//  breezr_flutter
//  services
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

import '../../injection.dart';
import '../services/scheduler.dart';
import '../services/secure_storage.dart';
import '../services/storage.dart';

SecureStorageService get $secureStorage => getIt<SecureStorageService>();

StorageService get $storage => getIt<StorageService>();

SchedulingService get $scheduler => getIt<SchedulingService>();
