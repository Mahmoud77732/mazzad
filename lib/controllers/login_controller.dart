// ignore_for_file: avoid_print, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/models/login_model.dart';
import 'package:mazzad/shared/network/remote/dio_helper.dart';

import '../../../../shared/network/end_points.dart';

class LoginController extends GetxController {
  ShopLoginModel? loginModel;

  void changeLoginModel(ShopLoginModel? loginModel) {
    this.loginModel = loginModel;
    update();
  }

  // DioHelper dioHelper = Get.find();

  void userlogin({
    required String email,
    required String password,
  }) {
    // emit(ShopLoginLoadingState());
    update();
    // dioHelper.postData(url: LOGIN, data: {
    DioHelper.postData(url: LOGIN, data: {
      // 'email': email,
      'username': email,
      'password': password,
      'scope': '*',
      'grant_type': 'password',
      'client_id': '95f97367-73a9-475a-b817-16c0d567d697',
      'client_secret': '331ONKkzjiVKT52ZeReYYN9xCjsQo4iCTPmNICvU',
    }).then((value) {
      print(value.data);
      //i'm ready to take response object
      loginModel = ShopLoginModel.fromJson(value.data);
      // emit(ShopLoginSuccessState(loginModel: loginModel));
      changeLoginModel(loginModel);
      update();
    }).catchError((error) {
      print(error.toString());
      // emit(ShopLoginErrorState(error.toString()));
      update();
    });
  }

  //changable data is here replacement for ShopLoginScreen()
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = (isPassword)
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    // emit(ShopChangePasswordVisibilityState());
    update();
  }
}
