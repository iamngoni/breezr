//
//  breezr_flutter
//  scheduler
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

import 'dart:async';
import 'dart:developer';

import 'package:injectable/injectable.dart';

@singleton
class SchedulingService {
  static SchedulingService? _instance;
  final List<Timer> _timers = [];

  @factoryMethod
  static Future<SchedulingService> getInstance() async {
    _instance ??= SchedulingService();
    return _instance!;
  }

  // schedule a task
  Future<int> scheduleTask(
    Function task, {
    Duration duration = const Duration(minutes: 1),
  }) async {
    log('Scheduling task in $duration');
    final Timer timer = Timer.periodic(duration, (Timer t) {
      log('Task running at ${t.tick} minutes');
      task();
    });
    _timers.add(timer);
    return _timers.indexOf(timer);
  }

  // cancel a scheduled task
  void cancelTask(int index) {
    if (index < _timers.length) {
      _timers[index].cancel();
    }
  }
}
