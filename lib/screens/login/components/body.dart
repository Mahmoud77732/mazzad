// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/default_button.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/screens/SignUp/signup_screen.dart';
import 'package:mazzad/screens/login/components/background.dart';
import 'package:mazzad/screens/otb/otb_screen.dart';
import 'package:mazzad/size_config.dart';
import '../../../components/already_have_an_account_check.dart';

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
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Background(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Constants.kHorizontalSpacing),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: SizeConfig.screenHeight * 0.03),
              SvgPicture.asset('assets/icons/signin.svg',
                  height: SizeConfig.screenHeight * 0.35),
              SizedBox(height: 20),
              Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Constants.kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Constants.kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      hintText: 'Email address',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Constants.kPrimaryColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      focusColor: Constants.kPrimaryColor,
                      hoverColor: Constants.kPrimaryColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon((passVisible1)
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passVisible1 = !passVisible1;
                          });
                        },
                      ),
                      iconColor: Constants.kPrimaryColor,
                      suffixIconColor: Constants.kPrimaryColor,
                      prefixIconColor: Constants.kPrimaryColor,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: passVisible1,
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              DefaultButton(
                onPressed: () {
                  Get.toNamed(OTPScreen.routeName);
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
    );
  }
}
