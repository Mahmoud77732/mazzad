import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/auction_item.dart';
import 'package:mazzad/controller/auction_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _isLoading = true;
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
    // Get.put<AuctionController>(AuctionController());
    return DefaultTabController(
      length: _tabs.length,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Constants.kHorizontalSpacing,
        ),
        child: Column(
          children: [
            // Constants.kSmallVerticalSpacing,
            // const SearchTextField(),
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
                    return LiveByCategory();
                  } else if (_selectedTabBar == 1) {
                    return ScheduledByCategory();
                  } else {
                    return LiveByCategory();
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

class LiveByCategory extends StatefulWidget {
  @override
  State<LiveByCategory> createState() => _LiveByCategoryState();
}

class _LiveByCategoryState extends State<LiveByCategory> {
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  var isLoading1 = true.obs;
  var isLoading2 = true.obs;
  AuctionController? auctionController;

  @override
  void didChangeDependencies() {
    auctionController = Get.find<AuctionController>();
    isLoading1.value = false;
    isLoading2.value = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading1.value)
        ? const Center(child: CircularProgressIndicator())
        : SmartRefresher(
            enablePullUp: true,
            onRefresh: () async {
              if (kDebugMode) {
                print('---> inside the onRefresh live auctions');
              }
              bool refresed = await auctionController!
                  .getLiveAuctionsByCategory(isRefresh: true);
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
              bool refresed = await auctionController!
                  .getLiveAuctionsByCategory(isRefresh: false);
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
            child: (isLoading2.value)
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    itemCount:
                        auctionController!.liveAuctionsByCategoryLength.value,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: Constants.kHorizontalSpacing,
                      mainAxisSpacing: Constants.kHorizontalSpacing / 2,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (ctx, index) => AuctionItem(
                      myAuction: auctionController!
                          .liveAuctionsByCategory[index].myAuction,
                    ),
                  ),
          );
  }
}

class ScheduledByCategory extends StatefulWidget {
  ScheduledByCategory({Key? key}) : super(key: key);

  @override
  State<ScheduledByCategory> createState() => _ScheduledByCategoryState();
}

class _ScheduledByCategoryState extends State<ScheduledByCategory> {
  // final controller = Get.find<AuctionController>();
  final RefreshController refreshController = RefreshController(
    initialRefresh: false,
  );

  var isLoading1 = true.obs;
  var isLoading2 = true.obs;
  AuctionController? auctionController;

  @override
  void didChangeDependencies() {
    auctionController = Get.find<AuctionController>();
    isLoading1.value = false;
    isLoading2.value = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading1.value)
        ? const Center(child: CircularProgressIndicator())
        : SmartRefresher(
            enablePullUp: true,
            onRefresh: () async {
              if (kDebugMode) {
                print('inside the onRefresh Scheduled auctions');
              }
              bool refresed = await auctionController!
                  .getScheduledAuctionsByCategory(isRefresh: true);
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
              bool refresed = await auctionController!
                  .getScheduledAuctionsByCategory(isRefresh: false);
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
            child: (isLoading2.value)
                ? const Center(child: CircularProgressIndicator())
                : GridView.builder(
                    itemCount: auctionController!
                        .scheduledAuctionsByCategoryLength.value,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: Constants.kHorizontalSpacing,
                      mainAxisSpacing: Constants.kHorizontalSpacing / 2,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (ctx, index) => AuctionItem(
                      myAuction: auctionController!
                          .scheduledAuctionsByCategory[index].myAuction,
                    ),
                  ),
          );
  }
}
