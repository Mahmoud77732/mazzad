import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../components/auction_item.dart';
import '../../../constants.dart';
import '../../../controller/auction_controller.dart';

class LiveAuctions extends StatelessWidget {
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuctionController>(
        init: AuctionController(anyFunc: 'live'),
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
                myAuction: controller.liveAuctions[index].myAuction,
              ),
            ),
          );
        });
  }
}
