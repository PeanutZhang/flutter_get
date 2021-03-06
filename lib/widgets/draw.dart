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
                title: Text('图片流',style: itemStyle(),),
                onTap: () {
                  Navigator.pop(context);
                  redirect('tyfapp://imgflow');
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite,color: Colors.red,size: 24,),
                title: Text('单图信息',style: itemStyle(),),
                onTap: () {
                  Navigator.pop(context);
                  redirect('tyfapp://singlepage');
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
