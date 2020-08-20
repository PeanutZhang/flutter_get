import 'package:flutter/material.dart';
import 'package:flutter_exercise/router.dart';

import 'package:flutter_exercise/widgets/home_page/article_bottom_bar.dart';
import 'package:flutter_exercise/widgets/home_page/article_like_bar.dart';
import 'package:flutter_exercise/widgets/home_page/article_summary.dart';

import 'package:flutter_exercise/util/struct/content_detail.dart';

class ArticleCardItem extends StatelessWidget {
  final StructContentDetail articleInfo;

  ///
  const ArticleCardItem({Key key, this.articleInfo}) : super(key: key);

  /// 执行页面跳转到article_detail
  void goToArticleDetailPage(BuildContext context, String articleId) {
    Router().open(context, "tyfapp://contentpage?articleId=${articleId}");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(2.0),
        child: FlatButton(
            onPressed: ()=> goToArticleDetailPage(context,articleInfo.id),
            child: Column(
              children: <Widget>[
                ArticleSummary(
                  title: articleInfo.title,
                  summary: articleInfo.summary,
                  articleImage: articleInfo.articleImage,
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: <Widget>[
                    Expanded(
                        flex: 9,
                        child: ArticleBottomBar(
                            nickNme: articleInfo.userInfo.nickName,
                            headUrl: articleInfo.userInfo.headerUrl,
                            commentNum: articleInfo.commentNum)),
                    Expanded(
                        flex: 3,
                        child: ArticleLikeBar(
                          articleId: articleInfo.id,
                          likeNum: articleInfo.likeNum,
                        )
 )
                  ],
                )
              ],
            )));
  }
}
