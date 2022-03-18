// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/screens/SignUp/signup_screen.dart';
import 'package:mazzad/screens/login/components/background.dart';
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
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset('assets/icons/signin.svg', height: size.height * 0.35),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      hintText: 'Email address',
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
                ],
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              child: Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              onPressed: () {},
              color: kPrimaryColor,
              padding: EdgeInsets.fromLTRB(170, 15, 170, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
            ),
            SizedBox(height: 30),
            AlreadyHaveAnAccountCheck(
              login: true,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SignupScreen();
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
