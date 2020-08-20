import 'package:flutter/material.dart';
import 'package:flutter_exercise/styles/text_styles.dart';

///
class ArticleBottomBar extends StatelessWidget {
  final String headUrl;
  final int commentNum;
  final String nickNme;

  ///
  const ArticleBottomBar({Key key, this.nickNme,this.headUrl, this.commentNum})
      : super(key: key);

  Widget _getUserInfoWidget() {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.network(
            headUrl,
            height: 28,
            width: 28,
            fit: BoxFit.scaleDown,
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        Text(nickNme,style: TextStyles.commonStyle(),)
      ],
    );
  }

  Widget _getUserCommentWidget() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.comment,
          size: 16,
        ),
        Padding(padding: EdgeInsets.only(left: 10)),
        Text(
          '$commentNum',
          style: TextStyles.commonStyle(0.8),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Expanded(flex: 6, child: _getUserInfoWidget()),
        Expanded(
          flex: 2,
          child: _getUserCommentWidget(),
        )
      ],
    );
  }
}
