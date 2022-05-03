// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/default_button.dart';
import 'package:mazzad/components/default_text_field.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/screens/SignUp/signup_screen.dart';
import 'package:mazzad/screens/login/components/background.dart';
import 'package:mazzad/screens/otb/otb_screen.dart';
import 'package:mazzad/size_config.dart';

import '../../../components/already_have_an_account_check.dart';
import '../../../services/validator.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {
  bool passVisible1 = true;
  bool passVisible2 = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kHorizontalSpacing),
          child: Form(
            key: _formKey,
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
                    DefaultTextField(
                      title: 'Email Address',
                      validate: Validator.validateEmail,
                    ),
                    SizedBox(height: 5.0),
                    DefaultTextField(
                      title: 'Password',
                      isSecure: true,
                      validate: Validator.validatePassword,
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                DefaultButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Get.toNamed(OTPScreen.routeName);
                    }
                  },
                  text: 'Login',
                ),
                Constants.kBigVertcialSpacing,
                AlreadyHaveAnAccountCheck(
                  login: true,
                  press: () {
                    Get.toNamed(SignupScreen.routeName);
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
