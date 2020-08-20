import 'package:flutter/material.dart';
import 'package:flutter_exercise/api/content/index.dart';

import 'package:flutter_exercise/widgets/home_page/img_card.dart';
import 'package:flutter_exercise/util/struct/content_detail.dart';
///
class ImgFlowPageIndex extends StatefulWidget{
  ///
  const ImgFlowPageIndex();

  @override
  State<StatefulWidget> createState() =>ImgFlowPageState();
}

class ImgFlowPageState extends State<ImgFlowPageIndex>{

  List<StructContentDetail> contentlist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      contentlist = ApiContentIndex().getRecommendList();
    });

  }

  @override
  Widget build(BuildContext context) {

    List<StructContentDetail> tempList = [];

      return ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context,int index){

            if(index % 3 == 0){
              tempList = [this.contentlist[index]];
            }else{
              tempList.add(this.contentlist[index]);
            }

            if(index == contentlist.length -1 || (index+1) % 3 == 0){

              return ImgCard(
                position: index,
                contentLists: tempList,
                isLast: index == contentlist.length -1,
              );

            }
            return Container();
          },
          separatorBuilder:(content,index) => Divider(
            height: 1,
            color: Color(0xffdddddd),
          ),
          itemCount: contentlist.length);
  }

}