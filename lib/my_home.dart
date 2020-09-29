import 'package:flutter/material.dart';
import 'package:flutter_event_driven_app/connectors/counter_connector.dart';
import 'package:flutter_event_driven_app/events/event.dart';
import 'package:flutter_event_driven_app/events/event_bus.dart';

class MyHome extends StatelessWidget {
  final CounterConnector$ _counterConnector$;

  const MyHome(this._counterConnector$);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Driven Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Counter:',
            ),
            StreamBuilder<int>(
                stream: _counterConnector$.counter$,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: _incrementCounter,
                  child: Text('Increment'),
                ),
                SizedBox(width: 32),
                RaisedButton(
                  onPressed: _decrementCounter,
                  child: Text('Decrement'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _incrementCounter() {
    EventBus().publish(IncrementCounter());
  }

  void _decrementCounter() {
    EventBus().publish(DecrementCounter());
  }
}
