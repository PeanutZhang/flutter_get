import 'package:flutter/material.dart';
import 'package:flutter_exercise/router.dart';
import 'package:flutter_exercise/pages/entrance.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demoeee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: Router().registerRouter(),
      home: Entrance(),
    );
  }
}

