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

  int _currentIndex = 0;

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

    if (link == null) {
      return;
    }
    int indexNum = router.open(context, link);
    if (indexNum > -1 && _currentIndex != indexNum) {
      setState(() {
        _currentIndex = indexNum;
      });
    }

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

  Widget createBottomNavigationBar() {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              title: Text('推荐'),
              activeIcon: Icon(Icons.star_border)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              title: Text('收藏'),
              activeIcon: Icon(Icons.favorite_border)),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              title: Text('我的'),
              activeIcon: Icon(Icons.person_outline)),
        ],
        iconSize: 24,
        selectedItemColor: Colors.red,
        onTap: (index) {
          if (index != _currentIndex) {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        currentIndex: _currentIndex);
  }

  Widget _getPagePage(int index) {
    List<Widget> listWidgets = [
      router.getPageByRouter('homepage'),
      Icon(Icons.directions_transit),
      router.getPageByRouter('userpage')
    ];
    return Offstage(
      offstage: _currentIndex != index,
      child: TickerMode(
        enabled: _currentIndex == index,
        child: listWidgets[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('NavigationBar'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: SearchPageCustomDelegate(),
                    query: '我全都要');
              })
        ],
      ),
      body: Stack(
        children: <Widget>[
          _getPagePage(0),
          _getPagePage(1),
          _getPagePage(2)
        ],
      ),
      drawer: DrawMenu(redirect),
      bottomNavigationBar: createBottomNavigationBar(),
    );
  }
}
