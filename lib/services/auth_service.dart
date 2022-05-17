import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../utils/logger.dart';

class AuthService {
  static final GetStorage box = GetStorage('AuthService');

  static Future<String> get token async =>
      await box.read('access_token') ?? "empty access_token";
  static Future<String> get refreshToken async =>
      await box.read('refresh_token') ?? "empty refresh_token";

  static Future<bool> get isLoggedIn async =>
      await box.read('access_token') == null ||
              await box.read('refresh_token') == null ||
              await box.read('duration') == null
          ? false
          : true;

  static Future<bool> signUp({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    try {
      final res = await http.post(
        Uri.parse("${Constants.api}/register"),
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'phone_number': phoneNumber,
        }),
        headers: await Constants.headers,
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        if (kDebugMode) {
          print(res.body);
        }
      } else if (res.statusCode == 400) {
        if (kDebugMode) {
          print(res.body);
          print('Invalid Data');
        }
      } else {
        if (kDebugMode) {
          print(res.body);
        }
      }
      final resBody = jsonDecode(res.body);
      if (resBody != null) {
        final check = await signin(email: email, password: password);
        if (check) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> signin(
      {required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.api}/oauth/token'),
        body: jsonEncode({
          'username': email,
          'password': password,
          "grant_type": "password",
          "scope": "*",
          "client_id": Constants.clientId,
          "client_secret": Constants.clientSecret,
        }),
        headers: await Constants.headers,
      );

      if (response.statusCode == 200) {
        final _josonData = jsonDecode(response.body);

        await box.write("access_token", _josonData['data']["access_token"]);
        await box.write("refresh_token", _josonData['data']["refresh_token"]);
        double expiredDurationTemp = _josonData['data']["expires_in"] / 60;
        int expiredDuration = expiredDurationTemp.toInt();
        int expiredIn = DateTime.now()
            .add(Duration(minutes: expiredDuration))
            .millisecondsSinceEpoch;
        await box.write("duration", expiredIn);
        return true;
      } else {
        String e = jsonDecode(response.body)['message'];
        SimpleLogPrinter('AuthService');
        if (kDebugMode) {
          print(e);
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      SimpleLogPrinter('AuthService');
      return false;
    }
  }

  static void updateToken({required String refreshToken}) async {
    final _body = {
      'client_id': Constants.clientId,
      'client_secret': Constants.clientSecret,
      'grant_type': 'refresh_token',
      'scope': '*',
      'refresh_token': refreshToken,
    };
    final response = await http.post(
      Uri.parse('${Constants.api}/oauth/token'),
      body: jsonEncode(_body),
      headers: await Constants.headers,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final _josonData = jsonDecode(response.body);
      await box.write("access_token", _josonData['data']["access_token"]);
      await box.write("refresh_token", _josonData['data']["refresh_token"]);
      double expiredDurationTemp = _josonData['data']["expires_in"] / 60;
      int expiredDuration = expiredDurationTemp.toInt();
      int expiredIn = DateTime.now()
          .add(Duration(minutes: expiredDuration))
          .millisecondsSinceEpoch;
      await box.write("duration", expiredIn);
    } else {
      String e = jsonDecode(response.body)['message'];
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
