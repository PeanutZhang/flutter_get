import 'package:flutter_exercise/styles/text_styles.dart';
import 'package:flutter/material.dart';

///文章内容
class ArticleContent extends StatelessWidget{

  final String content;


  ///
 const ArticleContent({Key k,this.content}):super(key:k);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8.0),
      child: Text(content,softWrap:true,style: TextStyles.commonStyle(),),
    );
  }



}