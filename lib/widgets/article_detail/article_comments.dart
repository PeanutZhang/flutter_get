import 'package:flutter/material.dart';
import 'package:flutter_exercise/util/struct/commnet_info.dart';
import 'package:flutter_exercise/styles/text_styles.dart';

class ArticleComments extends StatelessWidget {
  final List<StructCommentInfo> commentList;

  ///
  const ArticleComments({Key key, this.commentList}) : super(key: key);

  Widget getOneItemComent(int index) {
    StructCommentInfo commentInfo = commentList[index];
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.network(
                commentInfo.userInfo?.headerUrl,
                height: 50,
                width: 50,
                fit: BoxFit.scaleDown,
              ),
            )),
        Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  commentInfo.userInfo.nickName,
                  style: TextStyles.commonStyle(),
                ),
                Text(commentInfo.comment,style: TextStyles.commonStyle(),)
              ],
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context,index) => getOneItemComent(index),
        separatorBuilder: (context, index) => Divider(
              color: Colors.grey,
              height: 0.75,
            ),
        itemCount: commentList.length);
  }
}
