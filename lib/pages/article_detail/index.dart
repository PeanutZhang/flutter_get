import 'package:flutter/material.dart';

import 'package:flutter_exercise/util/tools/json_config.dart';
import 'package:flutter_exercise/widgets/article_detail/article_comments.dart';
import 'package:flutter_exercise/widgets/article_detail/article_detail.dart';
import 'package:flutter_exercise/widgets/article_detail/article_detail_like.dart';
import 'package:flutter_exercise/util/struct/content_detail.dart';
import 'package:flutter_exercise/api/content/index.dart';

///
class ArticleDetailIndex extends StatelessWidget {
  final String articleId;

  ///
  const ArticleDetailIndex({Key key, this.articleId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String id = articleId;
    if (articleId == null &&
        ModalRoute.of(context).settings.arguments != null) {
      Map dataInfo =
          JsonConfig.objectToMap(ModalRoute.of(context).settings.arguments);
      id = dataInfo['articleId'].toString();
    }
    if (id == null) {
      return Text('some Error');
    }

    StructContentDetail articleInfo = ApiContentIndex().getOneById(id);
    print(
        'articleInfo==>  id= '
            '${articleInfo.id} likeNum=> ${articleInfo.likeNum}');
    return Column(
      children: <Widget>[
        ArticleContent(
          content: articleInfo.detailInfo,
        ),
        ArticleDetailLike(
          articleId: articleInfo.id,
          likeNum: articleInfo.likeNum,
        ),
        ArticleComments(
          commentList: [],
        )
      ],
    );
  }
}
