//
//  breezr_flutter
//  secure_storage
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@singleton
class SecureStorageService {
  static SecureStorageService? _instance;
  static FlutterSecureStorage? _storage;

  @factoryMethod
  static Future<SecureStorageService> getInstance() async {
    _instance ??= SecureStorageService();

    _storage ??= const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
        resetOnError: true,
      ),
    );

    return _instance!;
  }

  Future<void> saveToDisk(String key, String content) async {
    await _storage!.write(key: key, value: content);
  }

  Future<String?> getFromDisk(String key) async {
    final value = await _storage!.read(key: key);
    return value;
  }

  Future<void> removeFromDisk(String key) async {
    await _storage!.delete(key: key);
  }

  Future<void> clearDisk() async {
    await _storage!.deleteAll();
  }
}
