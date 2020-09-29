import 'dart:async';

import 'package:flutter_event_driven_app/events/event.dart';
import 'package:flutter_event_driven_app/events/event_bus.dart';

abstract class Behavior {
  Stream<Event> event$;
  StreamSubscription _subscription;

  void initialize() {
    event$ = EventBus().event$;
    _subscription = this();
  }

  void dispose() => _subscription?.cancel();

  StreamSubscription call();
}
