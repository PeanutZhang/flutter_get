
import 'package:flutter/material.dart';

class LikeNumModel with ChangeNotifier {


  Map<String, int> _likeInfo;

  void setLikeNum(String articleId, int num) {
    if (_likeInfo == null) {
      _likeInfo = {};
    }
    if (articleId == null) {
      return;
    }

    _likeInfo[articleId] = num;

  }

  int getLikeNum(String articleId,[int likeNum = 0]){
    if(_likeInfo == null){
      _likeInfo = {};
    }

    if(articleId == null){
      return likeNum;
    }
    if(_likeInfo[articleId] == null){
      _likeInfo[articleId] = likeNum;
    }

    return _likeInfo[articleId];
  }

  /// 修改当前name，随机选取一个
  void like(String articleId) {
    if (_likeInfo == null || articleId == null) {
      _likeInfo = {};
    }
    if (_likeInfo == null || _likeInfo[articleId] == null) {
      _likeInfo[articleId] = 0;
    }
    _likeInfo[articleId] = _likeInfo[articleId] + 1;
    notifyListeners();
  }


}