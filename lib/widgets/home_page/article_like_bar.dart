import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_exercise/styles/text_styles.dart';
import 'package:flutter_exercise/model/like_num_model.dart';

///
class ArticleLikeBar extends StatelessWidget {
  final String articleId;
  final int likeNum;

  ///
  const ArticleLikeBar({Key key, this.articleId, this.likeNum})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    LikeNumModel likeNumModel = Provider.of<LikeNumModel>(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: FlatButton(
                onPressed: () => likeNumModel.like(articleId),
                child: Row(
                  children: <Widget>[
                    Expanded(child:
                    Icon(
                      Icons.thumb_up,
                      size: 16,
                    )),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(child:Text(
                      '${likeNumModel.getLikeNum(articleId, likeNum)}',
                      style: TextStyles.commonStyle(0.8),
                    ))
                  ],
                )))
      ],
    );
  }
}
