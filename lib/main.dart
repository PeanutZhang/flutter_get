import 'package:flutter/material.dart';
import 'package:flutter_exercise/router.dart';
import 'package:flutter_exercise/pages/entrance.dart';
import 'package:provider/provider.dart';
import 'package:flutter_exercise/model/like_num_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final likeModel = LikeNumModel();

  @override
  Widget build(BuildContext context) {
    return Provider<Map<String, int>>.value(
      value: {},
      child: ChangeNotifierProvider.value(
        value: likeModel,
        child: MaterialApp(
          title: 'Flutter Demoeee',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: Router().registerRouter(),
          home: Entrance(),
        ),
      ),
    );
  }
}
