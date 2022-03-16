import 'package:flutter/material.dart';
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
            child: PageView.builder(
                itemCount: splashData.length,
                itemBuilder: (_, index) => OnBoardContent(
                      image: splashData[index]['image'],
                      text: splashData[index]['text'],
                    )),
          ),
          Row(
            children: List.generate(
              splashData.length,
              (index) => buildDot(index: index),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Login'),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Constants.kPrimaryColor),
            child: TextButton(
              onPressed: () {},
              child: Text('Login'),
            ),
          ),
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
      ),
    );
  }
}
