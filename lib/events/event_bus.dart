import 'package:flutter_event_driven_app/events/event.dart';
import 'package:rxdart/rxdart.dart';

/// Singleton event hub

class EventBus {
  final _event$ = PublishSubject<Event>();
  ConnectableStream<Event> _connectedEvent$;

  static final EventBus _instance = EventBus._internal();

  EventBus._internal();

  factory EventBus() {
    return _instance;
  }

  start() {
    _connectedEvent$ = _event$.publish();
    _connectedEvent$.connect();
  }

  Stream<Event> get event$ => _connectedEvent$;

  void publish<T extends Event>(T event) => _event$.add(event);

  dispose() {
    _event$.close();
  }
}
