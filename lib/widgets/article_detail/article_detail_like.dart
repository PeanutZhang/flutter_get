import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_exercise/model/like_num_model.dart';
import 'package:flutter_exercise/styles/text_styles.dart';

///
class ArticleDetailLike extends StatelessWidget {
  final String articleId;
  final int likeNum;

  ///
  const ArticleDetailLike({Key key, this.articleId, this.likeNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final likeNumModel = Provider.of<LikeNumModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FlatButton(
            onPressed: () => likeNumModel.like(articleId),
            child: Icon(
              Icons.thumb_up,
              color: Colors.grey,
              size: 40,
            )),
        Text(
          '${likeNumModel.getLikeNum(articleId, likeNum)}',
          style: TextStyles.commonStyle(),
        )
      ],
    );
  }
}
