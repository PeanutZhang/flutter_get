import 'package:flutter/material.dart';
import 'package:flutter_exercise/styles/text_styles.dart';

///
class ArticleSummary extends StatelessWidget {
  final String title;
  final String summary;
  final String articleImage;

  ///
  const ArticleSummary({Key key, this.title, this.summary, this.articleImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
            flex: 6,
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyles.commonStyle(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                Text(
                  summary,
                  style: TextStyles.commonStyle(0.8, Colors.grey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )),
        Expanded(
            flex: 2,
            child: Image.network(articleImage,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
            ))
      ],
    );
  }
}
