import 'package:flutter_exercise/util/struct/user_struct.dart';


class ApiUserInfoIndex{

  /// 根据用户id拉取用户信息
  static StructUserInfo getOneById(String id) {
    return StructUserInfo('1001', 'test 001',
        'http://image.biaobaiju.com/uploads/20180211/00/1518279965-WhqyaQodpn.jpg');
  }

}