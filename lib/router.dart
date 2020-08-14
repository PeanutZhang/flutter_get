import 'package:flutter/material.dart';
import 'package:flutter_exercise/pages/common/web_view_page.dart';

import 'package:flutter_exercise/pages/home_page/index.dart';
import 'package:flutter_exercise/pages/user_page/index.dart';
import 'package:flutter_exercise/util/struct/router_struct.dart';

/// 处理APP内的跳转
/// action mapping
const Map<String, List<String>> paramsMapping = {
  'homepage': null,
  'userpage': ['userId']
};

/// 路由配置信息
/// widget 为组件
/// entranceIndex 为首页位置，如果非首页则为-1
/// params 为组件需要的参数数组
const Map<String, RouterStruct> routerMapping = {
  'homepage': RouterStruct(HomeIndex(), 0, null),
  'userpage': RouterStruct(UserIndex(), 2, ['userId']),
  'default': RouterStruct(HomeIndex(), 0, null)
};

class Router {
//  static const homePage = 'app://';
  final String appScheme = 'tyfapp';

  Router();

  /// 根据url处理获得需要跳转的action页面以及需要携带的参数
  Widget _getPage(String url, Map<String, dynamic> urlParseRet) {
    if (url.startsWith('https://') || url.startsWith('http://')) {
      return CommonWebViewPage(url: url);
    } else if (url.startsWith(appScheme)) {
      // 判断是否解析出 path action，并且能否在路由配置中找到
      String pathAction = urlParseRet['action'].toString();
      switch (pathAction) {
        case "homepage":
          {
            return _buildPage(HomeIndex());
          }
        case "userpage":
          {
            // 必要性检查，如果没有参数则不做任何处理
            if (urlParseRet['params']['user_id'].toString() == null) {
              print('userId- null-');
              return null;
            }
            return _buildPage(
                UserIndex(userId: urlParseRet['params']['user_id'].toString()));
          }
        default:
          {
            return _buildPage(HomeIndex());
          }
      }
    }
    return null;
  }

  /// 执行页面跳转
//  Router.push(BuildContext context, String url) {
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return _getPage(url);
//    }));
//  }

  int open(BuildContext context, String url) {
    int notEntrancPageIndex = -1;

    if (url.startsWith('http://') || url.startsWith('https://')) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CommonWebViewPage(
          url: url,
        );
      }));
      return notEntrancPageIndex;
    }

    Map<String, dynamic> urlParseRes = _parseUrl(url);
    String act = urlParseRes['action'].toString();
    print('action: $act');
    if (act == '/') return -1;
    int entranceIndex = routerMapping[act].entrancePageIndex;
    if (entranceIndex > notEntrancPageIndex) {
      return entranceIndex;
    }
    Navigator.pushNamedAndRemoveUntil(context, urlParseRes['action'].toString(),
        (route) {
      print('route settings.name ${route.settings.name}');
      if (route.settings.name == urlParseRes['action'].toString()) {
        return false;
      }
      return true;
    }, arguments: urlParseRes['params']);
    return notEntrancPageIndex;
  }

  Widget getPageByRouter(String pageName) {
    Widget pageWidget =
        routerMapping[pageName].widget ?? routerMapping['default'].widget;
  }



  Map<String, Widget Function(BuildContext)> registerRouter() {

    Map<String,Widget Function(BuildContext)> routerInfo = {};
    routerMapping.forEach((routerName, value) {
      if(routerName == 'default'){
        return;
      }
      routerInfo[routerName] = (context) => _buildPage(value.widget);
    });


    return {
      'homepage': (context) => _buildPage(HomeIndex()),
      'userpage': (context) => _buildPage(UserIndex())
    };
  }

  Widget _buildPage(Widget page) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise .'),
      ),
      body: Center(
        child: page,
      ),
    );
  }

  /// 解析跳转的url，并且分析其内部参数
  Map<String, dynamic> _parseUrl(String url) {
    if (url.startsWith(appScheme)) {
      url = url.substring(9);
    }
    int placeIndex = url.indexOf('?');
    if (url == '' || url == null) {
      return {'action': '/', 'params': null};
    }
    if (placeIndex < 0) {
      return {'action': url, 'params': null};
    }

    String action = url.substring(0, placeIndex);
    String paramStr = url.substring(placeIndex + 1);

    if (paramStr == null) {
      return {'action': action, 'params': null};
    }

    Map params = {};
    List<String> paramsStrArr = paramStr.split('&');
    for (String singleParamsStr in paramsStrArr) {
      List<String> singleParamsArr = singleParamsStr.split('=');
      if (paramsMapping[action].indexOf(singleParamsArr[0]) > -1) {
        params[singleParamsArr[0]] = singleParamsArr[1];
      }
    }
    return {'action': action, 'params': params};
  }
}
