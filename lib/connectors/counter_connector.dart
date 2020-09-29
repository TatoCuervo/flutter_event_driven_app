import 'package:flutter_event_driven_app/events/event.dart';
import 'package:flutter_event_driven_app/events/event_bus.dart';
import 'package:rxdart/rxdart.dart';

class CounterConnector$ {
  int _counter = 0;

  Stream<int> get counter$ => EventBus().event$.map((event) {
        return event is IncrementCounter ? ++_counter : --_counter;
      }).startWith(_counter);
}
