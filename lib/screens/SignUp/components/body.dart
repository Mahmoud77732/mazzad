import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/already_have_an_account_check.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/controllers/login_controller.dart';
import 'package:mazzad/controllers/register_controller.dart';
import 'package:mazzad/screens/SignUp/components/background.dart';
import 'package:mazzad/screens/login/login_screen.dart';
import 'package:mazzad/shared/comonents/components.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  bool passVisible1 = true;
  bool passVisible2 = true;

  RegisterController registerController;
  LoginController loginController;

  Body(this.registerController, this.loginController);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        return Background(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.kHorizontalSpacing,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SignUp',
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                  SvgPicture.asset('assets/icons/singup.svg',
                      height: size.height * 0.35),
                  const SizedBox(height: 8.0),
                  Column(
                    children: [
                      //--------------------------------------------
                      // const DefaultTextField(
                      //   title: 'Name',
                      //   validate: Validator.validateName,
                      // ),
                      defaultFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        label: 'User Name',
                        prefix: Icons.person,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your name!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5.0),
                      // const DefaultTextField(
                      //   title: 'Your Email',
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
                      const SizedBox(height: 5.0),
                      // const DefaultTextField(
                      //   title: 'Phone',
                      //   validate: Validator.validatePhone,
                      // ),
                      defaultFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        label: 'Phone',
                        prefix: Icons.phone,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your phone';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5.0),
                      // DefaultTextField(
                      //   title: 'Password',
                      //   isSecure: true,
                      //   validate: Validator.validatePassword,
                      //   passwordFieldKey: _passwordFieldKey,
                      // ),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        label: 'Password',
                        isPassword: registerController.isPassword,
                        prefix: Icons.lock_outlined,
                        suffix: registerController.suffix,
                        suffixPressed: () {
                          registerController.changePasswordVisibility();
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
                        },
                      ),
                      const SizedBox(height: 5.0),
                      // DefaultTextField(
                      //   title: 'Confirm Password',
                      //   isSecure: true,
                      //   validate: Validator.validatePassword,
                      //   passwordFieldKey: _passwordFieldKey,
                      // ),
                      // const SizedBox(height: 5.0),
                      //--------------------------------------------
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  // DefaultButton(
                  //   text: 'Create',
                  //   onPressed: () {
                  //     if (formKey.currentState!.validate()) {
                  //       Get.toNamed(OTPScreen.routeName);
                  //     }
                  //   },
                  // ),
                  defaultButton(
                    function: () {
                      final formK = formKey.currentState;
                      if (formK != null && formK.validate()) {
                        registerController.userRegister(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          phone: phoneController.text,
                        );
                        // Get.toNamed(OTPScreen.routeName);
                      }
                    },
                    text: 'Create',
                    isUpperCase: true,
                  ),
                  Constants.kBigVertcialSpacing,
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Get.offAllNamed(LoginScreen.routeName);
                    },
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
