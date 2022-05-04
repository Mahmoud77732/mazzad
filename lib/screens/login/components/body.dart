// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/controllers/login_controller.dart';
import 'package:mazzad/screens/SignUp/signup_screen.dart';
import 'package:mazzad/screens/login/components/background.dart';
import 'package:mazzad/shared/comonents/components.dart';
import 'package:mazzad/size_config.dart';

import '../../../components/already_have_an_account_check.dart';

class Body extends StatelessWidget {
  bool passVisible1 = true;
  bool passVisible2 = true;

  var formKey = GlobalKey<FormState>();

  LoginController loginController;

  Body(this.loginController);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Background(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kHorizontalSpacing),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                SvgPicture.asset('assets/icons/signin.svg',
                    height: SizeConfig.screenHeight * 0.35),
                SizedBox(height: 20),
                Column(
                  children: [
                    // ----------------------------------------------------
                    // DefaultTextField(
                    //   title: 'Email Address',
                    //   validate: Validator.validateEmail,
                    // ),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      label: 'Email Address',
                      prefix: Icons.email_outlined,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 5.0),
                    // DefaultTextField(
                    //   title: 'Password',
                    //   isSecure: true,
                    //   validate: Validator.validatePassword,
                    // ),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      label: 'Password',
                      isPassword: loginController.isPassword,
                      prefix: Icons.lock_outlined,
                      suffix: loginController.suffix,
                      suffixPressed: () {
                        loginController.changePasswordVisibility();
                      },
                      onSubmit: (String text) {
                        if (formKey.currentState!.validate()) {
                          loginController.userlogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Password is too short';
                        }
                        return null;
                      },
                    ),
                    // ----------------------------------------------------
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                // DefaultButton(
                //   onPressed: () {
                //     if (formKey.currentState!.validate()) {
                //       Get.toNamed(OTPScreen.routeName);
                //     }
                //   },
                //   text: 'Login',
                // ),
                defaultButton(
                  function: () {
                    final formK = formKey.currentState;
                    if (formK != null && formK.validate()) {
                      loginController.userlogin(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      // Get.toNamed(OTPScreen.routeName); // !?
                    }
                  },
                  text: 'Login',
                  isUpperCase: true,
                ),
                Constants.kBigVertcialSpacing,
                AlreadyHaveAnAccountCheck(
                  login: true,
                  press: () {
                    // Get.toNamed(SignupScreen.routeName);
                    Get.toNamed('signupscreen');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
