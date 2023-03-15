import 'package:flutter/material.dart';



void main() => runApp(TestApp());
class TestApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Widgets',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: TestApp(),
    );
  }
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Log Rocket'),
          backgroundColor: Colors.green[600],
        ));
  }
}