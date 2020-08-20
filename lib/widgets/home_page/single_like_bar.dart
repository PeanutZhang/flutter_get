
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_exercise/model/like_num_model.dart';
import 'package:flutter_exercise/styles/text_styles.dart';



class SingleLikeBar extends StatelessWidget{

  final String articleId;
  final int likeNum;
  ///f
  const SingleLikeBar({Key key,this.articleId,this.likeNum}):super(key:key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final likeNumModel = Provider.of<LikeNumModel>(context);
    return Container(
      width: 50,
      child: FlatButton(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Icon(Icons.thumb_up, color: Colors.grey, size: 36),
            Padding(padding: EdgeInsets.only(top: 2)),
            Text(
              '${likeNumModel.getLikeNum(articleId, likeNum)}',
              style: TextStyles.commonStyle(),
            ),
          ],
        ),
        onPressed: () => likeNumModel.like(articleId),
      ),
    );
  }

}