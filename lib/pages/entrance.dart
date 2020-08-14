import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:uni_links/uni_links.dart';
import 'package:flutter/services.dart';

import 'package:flutter_exercise/router.dart';
import 'package:flutter_exercise/widgets/draw.dart';
import 'package:flutter_exercise/pages/search_page/search_page_delegate.dart';

enum UniLinkType {
  string,
}

class Entrance extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EntranceState();
}

class _EntranceState extends State<Entrance> {

  UniLinkType _type = UniLinkType.string;
  StreamSubscription _sub;
  Router router = Router();

  Future<void> initPlatformState() async {
    if (_type == UniLinkType.string) {
      await initPlatformStateForUniLink();
    }
  }


  Future<void> initPlatformStateForUniLink() async {
    String initialLink;

    try {
      initialLink = await getInitialLink();
//      initialLink='tyfapp://homepage';
      print('initlink--> $initialLink');
      if (initialLink != null) {
        router.open(context, initialLink);
      }
    } on PlatformException {
      initialLink = 'Failed to get initial link.';
    } on FormatException {
      initialLink = 'Failed to parse the initial link as Uri.';
    }

    _sub = getLinksStream().listen((String link) {
      print('listener--- is going');
      if (!mounted || link == null) return;
      router.open(context, link);
    }, onError: (Object err) {
      print('links listen error ${err.toString()}');
      if (!mounted) return;
    });
  }


  void redirect(String link) {

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _sub?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('NavigationBar'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {
            showSearch(context: context,
                delegate: SearchPageCustomDelegate(),
                query: '我全都要');
          })
        ],
      ),
      drawer: DrawMenu(redirect),
    );
  }

}
