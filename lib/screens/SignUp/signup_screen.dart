// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, unused_import, avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/controllers/login_controller.dart';
import 'package:mazzad/controllers/register_controller.dart';
import 'package:mazzad/screens/SignUp/components/body.dart';
import 'package:mazzad/shared/comonents/components.dart';

class SignupScreen extends StatelessWidget {
  static const routeName = '/signup_screen';

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  RegisterController registerController = Get.find();
  LoginController loginController = Get.find();

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      initState: (controllerState) {
        registerController.addListener(() {
          if (controllerState.controller!.loginModel != null) {
            // if (state.loginModel!.status ؟؟ false) {
            if (controllerState.controller!.loginModel!.status!) {
              showToast(
                msg: controllerState.controller!.loginModel!.message.toString(),
                state: ToastStates.SUCCESS,
              );
              Get.offNamedUntil('/loginscreen', (route) => false);
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
          body: Body(registerController, loginController),
        );
      },
    );
  }
}
