import 'package:flutter/material.dart';
import 'package:flutter_event_driven_app/behaviors/behavior_register.dart';
import 'package:flutter_event_driven_app/connectors/counter_connector.dart';
import 'package:flutter_event_driven_app/events/event_bus.dart';
import 'package:flutter_event_driven_app/my_home.dart';

void main() {
  // Before starting the event bus, register all needed behaviors.
  BehaviorRegister().registerAll();

  // start the Event bus
  EventBus().start();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Driven Counter App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHome(CounterConnector$()),
    );
  }
}
