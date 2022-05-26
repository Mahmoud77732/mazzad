import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../components/auction_item.dart';
import '../../../constants.dart';
import '../../../controller/auctions_by_category_controller.dart';

class LiveAuctionsByCategory extends StatefulWidget {
  @override
  State<LiveAuctionsByCategory> createState() => _LiveAuctionsByCategoryState();
}

class _LiveAuctionsByCategoryState extends State<LiveAuctionsByCategory> {
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );
  @override
  void initState() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuctionsByCategoryController>(
        init: AuctionsByCategoryController(anyFunc: 'live'),
        builder: (auctionController) {
          return (!auctionController.initialized)
              ? const Center(child: CircularProgressIndicator())
              : SmartRefresher(
                  enablePullUp: true,
                  onRefresh: () async {
                    if (kDebugMode) {
                      print('---> inside the onRefresh live auctions');
                    }
                    bool refresed = await auctionController
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
                    bool refresed = await auctionController
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
                  child: (!auctionController.initialized)
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          itemCount: auctionController
                              .liveAuctionsByCategoryLength.value,
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: Constants.kHorizontalSpacing,
                            mainAxisSpacing: Constants.kHorizontalSpacing / 2,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (ctx, index) => (!auctionController
                                  .initialized)
                              ? const Center(child: CircularProgressIndicator())
                              : AuctionItem(
                                  myAuction: auctionController
                                      .liveAuctionsByCategory[index].myAuction,
                                ),
                        ),
                );
        });
  }
}
