import 'package:flutter_event_driven_app/behaviors/behavior.dart';
import 'package:flutter_event_driven_app/behaviors/counter_logging.dart';

class BehaviorRegister {
  static final BehaviorRegister _instance = BehaviorRegister._internal();

  BehaviorRegister._internal();

  factory BehaviorRegister() {
    return _instance;
  }

  final List<Behavior> _behaviors = [CounterLogging()];

  void registerAll() => _behaviors.forEach(
        (behavior) => behavior.initialize(),
      );
}
