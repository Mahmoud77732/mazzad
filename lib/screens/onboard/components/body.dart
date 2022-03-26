import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/default_button.dart';
import 'package:mazzad/screens/SignUp/signup_screen.dart';
import 'package:mazzad/screens/login/login_screen.dart';
import './on_board_content.dart';
import './/constants.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Mazzad, Lets bid!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people bid, buy and setup auctions for their used and new products around the whole Egypt",
      "image": "assets/images/splash_2.png"
    },
    {
      "text":
          "We shoe the easy way to attened and host auctions.\nJust stay at home with us!",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: PageView.builder(
              itemCount: splashData.length,
              itemBuilder: (_, index) => OnBoardContent(
                image: splashData[index]['image'],
                text: splashData[index]['text'],
              ),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Constants.kHorizontalSpacing),
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      splashData.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: DefaultButton(
                          onPressed: () {
                            Get.offNamed(LoginScreen.routeName);
                          },
                          text: "Login",
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: DefaultButton(
                          onPressed: () {
                            Get.offNamed(SignupScreen.routeName);
                          },
                          text: "Sign Up",
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Constants.kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? Constants.kPrimaryColor
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
