import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/auction_item.dart';
import 'package:mazzad/controller/auction_c.dart';

import '../../../components/search_textfield.dart';
import '../../../constants.dart';

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
            const SearchTextField(),
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
  Live({Key? key}) : super(key: key);
  final controller = Get.put<AuctionController>(AuctionController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.liveAuctionsLength,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: Constants.kHorizontalSpacing,
        mainAxisSpacing: Constants.kHorizontalSpacing / 2,
        crossAxisCount: 2,
      ),
      itemBuilder: (ctx, index) => AuctionItem(
        name: controller.liveAuctions[index].name,
        image: controller.liveAuctions[index].image,
        currentBid: controller.liveAuctions[index].currentBid,
        status: controller.liveAuctions[index].status,
      ),
    );
  }
}

class Scheduled extends StatelessWidget {
  Scheduled({Key? key}) : super(key: key);
  final controller = Get.find<AuctionController>();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.scheduledAuctionsLength,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: Constants.kHorizontalSpacing,
        mainAxisSpacing: Constants.kHorizontalSpacing / 2,
        crossAxisCount: 2,
      ),
      itemBuilder: (ctx, index) => AuctionItem(
        name: controller.scheduledAuctions[index].name,
        image: controller.scheduledAuctions[index].image,
        currentBid: controller.scheduledAuctions[index].currentBid,
        status: controller.scheduledAuctions[index].status,
      ),
    );
  }
}

class UpComing extends StatelessWidget {
  UpComing({Key? key}) : super(key: key);
  final controller = Get.find<AuctionController>();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.liveAuctionsLength,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: Constants.kHorizontalSpacing,
        mainAxisSpacing: Constants.kHorizontalSpacing / 2,
        crossAxisCount: 2,
      ),
      itemBuilder: (ctx, index) => AuctionItem(
        name: controller.liveAuctions[index].name,
        image: controller.liveAuctions[index].image,
        currentBid: controller.liveAuctions[index].currentBid,
        status: controller.liveAuctions[index].status,
      ),
    );
  }
}
