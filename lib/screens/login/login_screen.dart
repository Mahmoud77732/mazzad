// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_import, avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/controllers/login_controller.dart';
import 'package:mazzad/shared/comonents/components.dart';
import 'package:mazzad/shared/network/local/cache_helper.dart';

import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login_screen';

  var scaffoldKey = GlobalKey<ScaffoldState>();

  bool passVisible1 = true;
  bool passVisible2 = true;
  // final _formKey = GlobalKey<FormState>();
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  LoginController loginController = Get.find();
  // LoginController loginController = Get.put(LoginController());

  void saveDataCache(GetBuilderState<LoginController> controllerState) {
    CacheHelper.saveData(
      key: 'refresh_token',
      value: controllerState.controller!.loginModel!.data!.refreshToken,
    ).then((value) {
      refreshToken =
          controllerState.controller!.loginModel!.data!.refreshToken!;
    });
    CacheHelper.saveData(
      key: 'expires_in',
      value: controllerState.controller!.loginModel!.data!.secExpiresDate,
    ).then((value) {
      intExpiresDate =
          controllerState.controller!.loginModel!.data!.secExpiresDate!;
    });
    CacheHelper.saveData(
      key: 'expiresDate',
      value: (DateTime.now()
              .add(Duration(seconds: CacheHelper.getData(key: 'expires_in'))))
          .toString(),
    ).then((value) {
      expiresDate = DateTime.now()
          .add(Duration(seconds: CacheHelper.getData(key: 'expires_in')));
    });
    CacheHelper.saveData(
      key: 'access_token',
      value: controllerState.controller!.loginModel!.data!.accessToken,
    ).then((value) {
      accessToken = controllerState.controller!.loginModel!.data!.accessToken!;
      Get.offNamedUntil('/homescreen', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      initState: (controllerState) {
        loginController.addListener(() {
          if (controllerState.controller != null &&
              controllerState.controller!.loginModel != null) {
            if (controllerState.controller!.loginModel!.status!) {
              showToast(
                msg: controllerState.controller!.loginModel!.message.toString(),
                state: ToastStates.SUCCESS,
              );
              saveDataCache(controllerState); // save token, data from response and navigate to homeScreen
            } else {
              showToast(
                msg: controllerState.controller!.loginModel!.message.toString(),
                state: ToastStates.ERROR,
              );
            }
          }
        });
      },
      builder: (controller) {
        return Scaffold(
          key: scaffoldKey,
          body: Body(loginController),
        );
      },
    );
  }
}
