import 'package:flutter/material.dart';
import 'package:flutter_exercise/util/tools/json_config.dart';

class UserIndex extends StatelessWidget {
  final String userId;

  const UserIndex({Key ky, this.userId}) : super(key: ky);

  @override
  Widget build(BuildContext context) {
    print('userPage build--');
    Map userInfo =
        JsonConfig.objectToMap(ModalRoute.of(context).settings.arguments);
    // TODO: implement build
    return Text('I\'m user page  userId = ${userInfo??['userId']}');
  }
}
