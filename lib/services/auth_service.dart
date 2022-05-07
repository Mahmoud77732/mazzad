import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mazzad/constants.dart';
import 'package:mazzad/utils/logger.dart';

class AuthService {
  static final GetStorage _box = GetStorage('AuthService');

  static Future<String> get token async => await _box.read('access_token');
  static Future<String> get refreshToken async =>
      await _box.read('refresh_token');
  static Future<bool> get isLoggedIn async =>
      await _box.read('access_token') == null ||
              await _box.read('refresh_token') == null ||
              await _box.read('duration') == null
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
        print(res.body);
      } else if (res.statusCode == 400) {
        print(res.body);
        print('Invalid Data');
      } else {
        print(res.body);
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

        await _box.write("access_token", _josonData['data']["access_token"]);
        await _box.write("refresh_token", _josonData['data']["refresh_token"]);
        double expiredDurationTemp = _josonData['data']["expires_in"] / 60;
        int expiredDuration = expiredDurationTemp.toInt();
        int expiredIn = DateTime.now()
            .add(Duration(minutes: expiredDuration))
            .millisecondsSinceEpoch;
        await _box.write("duration", expiredIn);
        return true;
      } else {
        String e = jsonDecode(response.body)['message'];
        SimpleLogPrinter('AuthService');
        print(e);
        return false;
      }
    } catch (e) {
      print(e);
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
      await _box.write("access_token", _josonData['data']["access_token"]);
      await _box.write("refresh_token", _josonData['data']["refresh_token"]);
      double expiredDurationTemp = _josonData['data']["expires_in"] / 60;
      int expiredDuration = expiredDurationTemp.toInt();
      int expiredIn = DateTime.now()
          .add(Duration(minutes: expiredDuration))
          .millisecondsSinceEpoch;
      await _box.write("duration", expiredIn);
    } else {
      String e = jsonDecode(response.body)['message'];
      print(e);
    }
  }
}
