
import 'package:flutter_exercise/util/struct/user_struct.dart';

class StructCommentInfo {
  /// 用户的昵称
  final StructUserInfo userInfo;

  /// 用户头像信息
  final String comment;

  /// 构造函数
  const StructCommentInfo(this.userInfo, this.comment);
}