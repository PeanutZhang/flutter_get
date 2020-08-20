import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_exercise/util/struct/content_detail.dart';
import 'package:flutter_exercise/router.dart';

class ImgCard extends StatelessWidget {
  final int position;
  final List<StructContentDetail> contentLists;
  final bool isLast;

  /// 执行页面跳转到article_detail
  void goToArticleDetailPage(BuildContext context, String articleId) {
    Router().open(context, "tyfapp://contentpage?articleId=${articleId}");
  }

  ///fuck
  const ImgCard({Key key, this.position, this.contentLists, this.isLast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (isLast) {
    }

    if ((position + 1) % 6 == 3) {
      return _withBigPic(context);
    } else {
      return _withSmallPic(context);
    }
  }

  Widget _withBigPic(BuildContext context) {
    if (Random().nextInt(1) == 1) {
      return Row(
        children: <Widget>[
          Expanded(flex: 6, 
              child: getFlatImg(context, contentLists[0], 200)),
          Expanded(flex: 3, 
              child: Column(
                children: <Widget>[
                  getFlatImg(context, contentLists[1]),
                  Padding(padding: EdgeInsets.only(top: 2)),
                  getFlatImg(context, contentLists[2])
                ],
              ))
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Column(
                children: <Widget>[
                  getFlatImg(context, contentLists[0]),
                  Padding(padding: EdgeInsets.only(top: 2)),
                  getFlatImg(context, contentLists[1])
                ],
              )),
          Expanded(
              flex: 6,
              child: getFlatImg(context, contentLists[2],200))
        ],
      );
    }
  }

  Widget _withSmallPic(BuildContext context) {
    List<Widget> rowList = [];
    for (var i = 0; i < 3; i++) {
      if (contentLists.length < i + 1) {
        rowList.add(Expanded(
          flex: 2,
          child: Row(),
        ));
        continue;
      }
      StructContentDetail articleInfo = contentLists[i];
      rowList.add(Expanded(flex: 2, child: getFlatImg(context, articleInfo)));
    }
    return Container(
      child: Row(
        children: rowList,
      ),
    );
    }


  /// 获取具体的图片组件
  Widget getFlatImg(BuildContext context, StructContentDetail articleInfo,
      [double size = 100]) {
    return FlatButton(
      padding: EdgeInsets.zero,
      onPressed: () => goToArticleDetailPage(context, articleInfo.id),
      child: Image.network(
        articleInfo.articleImage,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
        height: size,
      ),
    );
  }
}
