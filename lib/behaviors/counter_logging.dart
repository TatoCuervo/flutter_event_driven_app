import 'dart:async';

import 'package:flutter_event_driven_app/behaviors/behavior.dart';

class CounterLogging extends Behavior {
  @override
  StreamSubscription call() => event$.listen((event) {
        print(event.runtimeType);
      });
}
