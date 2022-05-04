// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/models/login_model.dart';
import 'package:mazzad/shared/network/remote/dio_helper.dart';

import '../../../../shared/network/end_points.dart';

class RegisterController extends GetxController {
  ShopLoginModel? loginModel;

  void changeLoginModel(ShopLoginModel? loginModel) {
    this.loginModel = loginModel;
    update();
  }

  // DioHelper dioHelper = Get.find();

  void userRegister({
    required String email,
    required String name,
    String? phone,
    required String password,
  }) {
    // emit(ShopRegisterLoadingState());
    update();
    // dioHelper.postData(url: REGISTER, data: {
    DioHelper.postData(url: REGISTER, data: {
      'email': email,
      'name': name,
      'phone_number': phone,
      'password': password,
      // 'scope': '*',
      // 'grant_type': 'password',
      // 'client_id': '95f97367-73a9-475a-b817-16c0d567d697',
      // 'client_secret': '331ONKkzjiVKT52ZeReYYN9xCjsQo4iCTPmNICvU',
    }).then((value) {
      print('----> value.data= ${value.data}');
      //i'm ready to take response object
      loginModel = ShopLoginModel.fromJson(value.data);
      print('----------------------------------');
      print('loginModel!.status= __${loginModel!.status.toString()}__');
      print('loginModel!.message= __${loginModel!.message.toString()}__');
      print('loginModel!.data!.accessToken= __${loginModel!.data!.accessToken.toString()}__');
      print('loginModel!.data!.refreshToken= __${loginModel!.data!.refreshToken.toString()}__');
      print(
          'loginModel!.data!.clientId= __${loginModel!.data!.clientId.toString()}__');
      print('----------------------------------');
      // emit(ShopRegisterSuccessState(loginModel: loginModel));
      changeLoginModel(loginModel);
      update();
    }).catchError((error) {
      print(error.toString());
      // emit(ShopRegisterErrorState(error.toString()));
      // update();
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
    // emit(ShopRegisterChangePasswordVisibilityState());
    update();
  }
}
