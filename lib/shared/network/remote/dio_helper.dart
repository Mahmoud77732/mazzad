// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:mazzad/constants.dart';
import 'package:mazzad/main.dart';
import 'package:mazzad/shared/network/end_points.dart';
import 'package:mazzad/shared/network/local/cache_helper.dart';

// class DioHelper extends GetxController {
class DioHelper {
  static late Dio dio = Dio();

  // --------------------------------------------------------------------

  // static init() {
  //   print('---> init()');
  //   dio = Dio(
  //     BaseOptions(
  //       baseUrl: 'https://mazzad.unidevs.co/api/',
  //       receiveDataWhenStatusError: true,
  //       connectTimeout: 20 * 1000,
  //       receiveTimeout: 20 * 1000,
  //     ),
  //   );
  // }

  // --------------------------------------------------------------------

  // DioHelper(){
  static init() async {
    print('********************************************************');
    print('---> init()');
    print('-------> DioHelper()');
    print('********************************************************');
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (!options.path.contains('https')) {
        options.path = 'https://mazzad.unidevs.co/api/' + options.path;
        // options.baseUrl = 'https://mazzad.unidevs.co/api/';
        options.receiveDataWhenStatusError = true;
        options.connectTimeout = 20 * 1000;
        options.receiveTimeout = 20 * 1000;
        print('----> DioHelper().options.path:__ ${options.path} __');
      }
      print('----> DioHelper().options.path:__ ${options.path} __');
      options.headers['Authorization'] = 'Bearer $accessToken';
      print(
          '----> DioHelper.options.headers[\'Authorization\']:__ ${options.headers['Authorization']} __');
      return handler.next(options);
    }, onResponse: (Response response, handler) async { //! onResponse wasn't found
      print('----------> DioHelper.onError()');
      if ((response.statusCode == 401)) {
        // && (error.response?.data['status'] == "false") || !expiresDate!.isAfter(DateTime.now())
        print('-----> DioHelper().onError.if1');
        if (await CacheHelper.sharedPreferences.containsKey('refresh_token')) {
          print('-----> DioHelper().onError.if2');
          // will throw error below
          await refreshToken();
          return handler.resolve(await _retry(response.requestOptions));
        }
      }
      print('-----> DioHelper().onError.end');
      return handler.next(response);
    }, onError: (DioError error, ErrorInterceptorHandler handler) async {
      print('----------> DioHelper.onError()');
      if ((error.response?.statusCode == 401)) {
        // && (error.response?.data['status'] == "false") || !expiresDate!.isAfter(DateTime.now())
        print('-----> DioHelper().onError.if1');
        if (await CacheHelper.sharedPreferences.containsKey('refresh_token')) {
          print('-----> DioHelper().onError.if2');
          // will throw error below
          await refreshToken();
          return handler.resolve(await _retry(error.requestOptions));
        }
      }
      print('-----> DioHelper().onError.end');
      return handler.next(error);
    }));
  }

  //* ------------------------------------------------------------
  static Future<void> refreshToken() async {
    print('-------> DioHelper.refreshToken()');
    final refreshToken = await CacheHelper.getData(key: 'refresh_token');
    final response = await dio.post(
      LOGIN,
      data: {
        'client_id': '95f97367-73a9-475a-b817-16c0d567d697',
        'client_secret': '331ONKkzjiVKT52ZeReYYN9xCjsQo4iCTPmNICvU',
        'grant_type': 'refresh_token',
        'scope': '*',
        'refresh_token': refreshToken,
      },
    );
    print('--------> DioHelper.respnse: __ $response __');
    if (response.statusCode == 201 ||
        response.data['status'] == 'true' ||
        response.data["message"] == "SUCCESSFULLY_REFRESHED_TOKEN") {
      // successfully got the new access token
      accessToken = response.data['access_token'];
      expiresDate = DateTime.now()
          .add(Duration(seconds: CacheHelper.getData(key: 'expires_in')));
      print(
          '--------> DioHelper.refreshToken().if().expiresDate: __ $expiresDate __');
      // Get.offAllNamed('/shoplayout');
    } else {
      print('---> DioHelper.refreshToken.else');
      // refresh token is wrong so log out user.
      accessToken = null;
      // CacheHelper.removeData(key: 'access_token');
      // CacheHelper.removeData(key: 'refresh_token');
      // signOut(context);
      CacheHelper.sharedPreferences.clear().then((value) {
        // navigateAndFinish(context, ShopLoginScreen());
        Get.offAllNamed('/shoploginscreen');
      });
    }
  }

  static Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    print('----> DioHelper()._retry()');
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
  //* ------------------------------------------------------------

  // static Future<Response> getData({
  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String token = '',
  }) async {
    // headers here somtimes delete above headers and maybe cause error so i commented it
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
      // 'token': token,
    };
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  // Future<Response> postData({
  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String token = '',
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    };
    print('----> DioHelper.postData().url= $url');
    return dio.post(url, queryParameters: query, data: data);
  }

  // Future<Response> putData({
  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String token = '',
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return dio.put(url, queryParameters: query, data: data);
  }
}
