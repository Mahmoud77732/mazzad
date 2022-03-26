import 'package:flutter/material.dart';
import 'package:mazzad/components/auction_item.dart';
import 'package:mazzad/components/search_textfield.dart';
import 'package:mazzad/constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<Tab> _tabs = const [
    Tab(
      text: 'Live',
    ),
    Tab(
      text: 'Scheduled',
    ),
    Tab(
      text: 'Upcoming',
    ),
  ];
  int _selectedTabBar = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.kHorizontalSpacing,
        ),
        child: Column(
          children: [
            Constants.kSmallVerticalSpacing,
            SearchTextField(),
            Constants.kSmallVerticalSpacing,
            Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      offset: const Offset(1, 3),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ]),
              child: TabBar(
                tabs: _tabs,
                onTap: (index) {
                  setState(() {
                    _selectedTabBar = index;
                  });
                },
                labelColor: Constants.kPrimaryColor,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Creates border
                  color: Constants.kPrimaryColor.withOpacity(0.2),
                ),
              ),
            ),
            Constants.kSmallVerticalSpacing,
            Expanded(
              child: Builder(
                builder: (_) {
                  if (_selectedTabBar == 0) {
                    return Live();
                  } else if (_selectedTabBar == 1) {
                    return Scheduled();
                  } else if (_selectedTabBar == 2) {
                    return UpComing();
                  } else {
                    return Live();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Live extends StatelessWidget {
  const Live({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: Constants.kHorizontalSpacing,
        mainAxisSpacing: Constants.kHorizontalSpacing / 2,
        crossAxisCount: 2,
      ),
      children: List.generate(
        50,
        (index) => AuctionItem(
          name: 'Bet Controller ever',
          image: 'assets/images/slider1.jpg',
          currentBid: 450,
          status: Status.live,
        ),
      ),
    );
  }
}

class Scheduled extends StatelessWidget {
  const Scheduled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Constants.kHorizontalSpacing,
        mainAxisSpacing: Constants.kHorizontalSpacing / 2,
      ),
      children: List.generate(
        50,
        (index) => AuctionItem(
          name: 'Bet Controller ever',
          image: 'assets/images/slider1.jpg',
          currentBid: 450,
          status: Status.scheuled,
        ),
      ),
    );
  }
}

class UpComing extends StatelessWidget {
  const UpComing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: Constants.kHorizontalSpacing,
        mainAxisSpacing: Constants.kHorizontalSpacing / 2,
      ),
      children: List.generate(
        50,
        (index) => AuctionItem(
          name: 'Bet Controller ever',
          image: 'assets/images/slider1.jpg',
          currentBid: 450,
          status: Status.soon,
        ),
      ),
    );
  }
}
