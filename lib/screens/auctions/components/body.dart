import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/auction_item.dart';
import 'package:mazzad/controller/auction_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
    Get.put<AuctionController>(AuctionController());
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
            Constants.kSmallVerticalSpacing,
            Constants.kSmallVerticalSpacing,
            Constants.kSmallVerticalSpacing,
            Constants.kSmallVerticalSpacing,
          ],
        ),
      ),
    );
  }
}

class Live extends StatelessWidget {
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuctionController>(
        init: AuctionController(),
        builder: (controller) {
          return SmartRefresher(
            enablePullUp: true,
            onRefresh: () async {
              if (kDebugMode) {
                print('inside the onRefresh live auctions');
              }
              bool refresed = await controller.getLiveAuctions(isRefresh: true);
              if (refresed) {
                refreshController.refreshCompleted();
              } else {
                refreshController.refreshFailed();
              }
            },
            onLoading: () async {
              if (kDebugMode) {
                print('inside the onloading live auctions');
              }
              bool refresed =
                  await controller.getLiveAuctions(isRefresh: false);
              if (refresed) {
                if (kDebugMode) {
                  print(
                      'live data loaded successfully to the new to exsiting data');
                }
                refreshController.loadComplete();
              } else {
                if (kDebugMode) {
                  print(
                      'an err occured while loading the new live data to exsiting data');
                }
                refreshController.loadFailed();
              }
            },
            controller: refreshController,
            child: GridView.builder(
              itemCount: controller.liveAuctionsLength.value,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: Constants.kHorizontalSpacing,
                mainAxisSpacing: Constants.kHorizontalSpacing / 2,
                crossAxisCount: 2,
              ),
              itemBuilder: (ctx, index) => AuctionItem(
                name: controller.liveAuctions[index].name,
                description: controller.liveAuctions[index].description,
                image: controller.liveAuctions[index].image,
                currentBid: controller.liveAuctions[index].currentBid,
                status: controller.liveAuctions[index].status,
              ),
            ),
          );
        });
  }
}

class Scheduled extends StatelessWidget {
  Scheduled({Key? key}) : super(key: key);
  final controller = Get.find<AuctionController>();
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuctionController>(builder: (context) {
      return SmartRefresher(
        enablePullUp: true,
        onRefresh: () async {
          if (kDebugMode) {
            print('inside the onRefresh Scheduled auctions');
          }
          bool refresed =
              await controller.getScheduledAuctions(isRefresh: true);
          if (refresed) {
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          if (kDebugMode) {
            print('inside the onloading Scheduled auctions');
          }
          bool refresed =
              await controller.getScheduledAuctions(isRefresh: false);
          if (refresed) {
            if (kDebugMode) {
              print(
                  'Scheduled data loaded successfully to the new to exsiting data');
            }
            refreshController.loadComplete();
          } else {
            if (kDebugMode) {
              print(
                  'an err occured while loading the new live data to exsiting data');
            }
            refreshController.loadFailed();
          }
        },
        controller: refreshController,
        child: GridView.builder(
          itemCount: controller.scheduledAuctionsLength.value,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: Constants.kHorizontalSpacing,
            mainAxisSpacing: Constants.kHorizontalSpacing / 2,
            crossAxisCount: 2,
          ),
          itemBuilder: (ctx, index) => AuctionItem(
            name: controller.scheduledAuctions[index].name,
            description: controller.liveAuctions[index].description,
            image: controller.scheduledAuctions[index].image,
            currentBid: controller.scheduledAuctions[index].currentBid,
            status: controller.scheduledAuctions[index].status,
          ),
        ),
      );
    });
  }
}

class UpComing extends StatelessWidget {
  UpComing({Key? key}) : super(key: key);
  final controller = Get.find<AuctionController>();
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: controller.liveAuctionsLength.value,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: Constants.kHorizontalSpacing,
        mainAxisSpacing: Constants.kHorizontalSpacing / 2,
        crossAxisCount: 2,
      ),
      itemBuilder: (ctx, index) => AuctionItem(
        name: controller.liveAuctions[index].name,
        description: controller.liveAuctions[index].description,
        image: controller.liveAuctions[index].image,
        currentBid: controller.liveAuctions[index].currentBid,
        status: controller.liveAuctions[index].status,
      ),
    );
  }
}
