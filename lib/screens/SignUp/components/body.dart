// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/already_have_an_account_check.dart';
import 'package:mazzad/components/default_button.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/screens/SignUp/components/background.dart';
import 'package:mazzad/screens/login/login_screen.dart';
import 'package:mazzad/screens/otb/otb_screen.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
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
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: Constants.kHorizontalSpacing,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('SignUp', style: TextStyle(fontWeight: FontWeight.bold)),
            SvgPicture.asset('assets/icons/singup.svg',
                height: size.height * 0.35),
            SizedBox(height: 8.0),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Name',
                  ),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Your Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Phone',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
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
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: passVisible1,
                ),
                SizedBox(height: 5.0),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'Confirm Password',
                    suffixIcon: IconButton(
                      icon: Icon((passVisible2)
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          passVisible2 = !passVisible2;
                        });
                      },
                    ),
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: passVisible2,
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            DefaultButton(
              text: 'Create',
              onPressed: () {
                Get.toNamed(OTPScreen.routeName);
              },
            ),
            Constants.kBigVertcialSpacing,
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Get.offAllNamed(LoginScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
