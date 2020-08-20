import 'package:flutter/material.dart';

class BannerInfo extends StatelessWidget{


  final String bannerUrl;


  ///
  BannerInfo({Key key,this.bannerUrl}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Image.network(bannerUrl,
          width: MediaQuery.of(context).size.width,
          height: 100,
          fit: BoxFit.fill,
        )
      ],
    );
  }




}