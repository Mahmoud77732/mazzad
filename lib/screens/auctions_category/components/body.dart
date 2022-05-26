import 'package:flutter/material.dart';

import './live_auctions_by_category.dart';
import './scheduled_auctions_by_category.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _isLoading = true;
  final List<Tab> _tabs = const [
    Tab(
      text: 'Live',
    ),
    Tab(
      text: 'Scheduled',
    ),
  ];
  int _selectedTabBar = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

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
                    return LiveAuctionsByCategory();
                  } else if (_selectedTabBar == 1) {
                    return const ScheduledAuctionsByCategory();
                  } else {
                    return LiveAuctionsByCategory();
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
