import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

const Map cache = {};

class JsonConfig {
  static Future getConfig(String fileName) async {
    if (cache[fileName] != null) {
      return cache[fileName];
    }

    final jsonStr = await rootBundle.loadString('assets/json/$fileName.dart');
    try {
      var jsonRet = json.decode(jsonStr);
      cache[fileName] = jsonRet;
      return jsonRet;
    } catch (err) {
      return false;
    }
  }

  static Map objectToMap(Object data) {
    return jsonDecode(JsonCodec().encode(data)) as Map;
  }
}
