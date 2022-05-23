import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './on_board_content.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../screens/SignUp/signup_screen.dart';
import '../../login/login_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // final _controller = PageController();
  int currentPage = 0;
  // change the content of each onboard view in the PageView by the index of the PageView
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
              //        controller: _controller,
              itemCount: splashData.length,
              itemBuilder: (_, index) => OnBoardContent(
                image: splashData[index]['image'],
                text: splashData[index]['text'],
              ),
              onPageChanged: (index) {
                // to update the animated container :D
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
                  // SmoothPageIndicator(
                  //   controller: _controller,
                  //   count: splashData.length,
                  //   effect: const ExpandingDotsEffect(
                  //     dotHeight: 6,
                  //     dotWidth: 10,
                  //     activeDotColor: Constants.kPrimaryColor,
                  //   ),
                  // ),
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
                  const Spacer(),
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
