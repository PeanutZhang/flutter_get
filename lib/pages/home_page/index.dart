import 'package:flutter/material.dart';

import 'package:flutter_exercise/widgets/home_page/article_card_item.dart';
import 'package:flutter_exercise/util/struct/content_detail.dart';
import 'package:flutter_exercise/api/content/index.dart';

///
class HomeIndex extends StatefulWidget {
  ///
  const HomeIndex();

  @override
  State<StatefulWidget> createState() => HomeIndexState();
}

///
class HomeIndexState extends State<HomeIndex> {
  List<StructContentDetail> contentList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      contentList = ApiContentIndex().getRecommendList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context,position){
          return ArticleCardItem(articleInfo: contentList[position],);
        },
        separatorBuilder: (context, postion) => Divider(
              color: Color(0xffDDDDDD),
              height: 1,
            ),
        itemCount: contentList.length);
  }
}
