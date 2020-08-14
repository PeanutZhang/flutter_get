import 'package:flutter/material.dart';

class DrawMenu extends StatelessWidget {
  /// 跳转方法
  final Function redirect;
  ///
  const DrawMenu(this.redirect);

  TextStyle itemStyle()=>TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: MediaQuery.removePadding(context: context,
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.star,color: Colors.red,size: 24,),
                title: Text('推荐',style: itemStyle(),),
                onTap: () {
                  Navigator.pop(context);
                  redirect('tyfapp://homepage');
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: Colors.red,size: 24,),
                title: Text('收藏',style: itemStyle(),),
                onTap: () {
                  Navigator.pop(context);
                  redirect('https://dart.cn/codelabs/dart-cheatsheet');
                },
              ),
              ListTile(
                leading: Icon(Icons.person,color: Colors.red,size: 24,),
                title: Text('我的',style: itemStyle(),),
                onTap: () {
                  Navigator.pop(context);
                  redirect('tyfapp://userpage');
                },
              )
            ],
          )),
    );
  }
}
