import 'package:flutter/material.dart';

import 'package:flutter_exercise/widgets/home_page/single_bottom_summary.dart';
import 'package:flutter_exercise/widgets/home_page/single_like_bar.dart';
import 'package:flutter_exercise/widgets/home_page/single_right_bar.dart';

import 'package:flutter_exercise/api/content/index.dart';
import 'package:flutter_exercise/util/struct/content_detail.dart';

///
class SinglePageIndex extends StatefulWidget {
  ///
  const SinglePageIndex();

  @override
  State<StatefulWidget> createState() => SinglePageState();
}

///
class SinglePageState extends State<SinglePageIndex> {
  int indexPos;
  List<StructContentDetail> contentlist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indexPos = 0;
    setState(() {
      contentlist = ApiContentIndex().getRecommendList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(contentlist[indexPos].articleImage),
              fit: BoxFit.contain)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SingleRightBar(
            nickname: contentlist[indexPos].userInfo.nickName,
            headerImage: contentlist[indexPos].userInfo.headerUrl,
            commentNum: contentlist[indexPos].commentNum,
          ),
          SingleLikeBar(
            articleId: contentlist[indexPos].id,
            likeNum: contentlist[indexPos].likeNum,
          ),
          SingleBottomSummary(
            articleId: contentlist[indexPos].id,
            title: contentlist[indexPos].title,
            summary: contentlist[indexPos].summary,
          )
        ],
      ),
    );
  }
}
