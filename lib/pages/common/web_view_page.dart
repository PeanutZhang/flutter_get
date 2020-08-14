import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class CommonWebViewPage extends StatelessWidget {
  final String url;

  CommonWebViewPage({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WebviewScaffold(
      url: url,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
