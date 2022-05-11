import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class BaseService {
  BaseService([this.serviceName = 'BaseService']);
  final String serviceName;

  Future<dynamic> get(
    Uri uri, [
    String functionName = "fun",
  ]) async {
    try {
      final res = await http.get(
        uri,
        headers: await Constants.headers,
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        return dataFromBody(res.body);
      } else {
        if (kDebugMode) {
          print("$functionName:: statusCode:  ${res.statusCode}");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  dynamic dataFromBody(dynamic body) {
    return jsonDecode(body)['data'];
  }
}
