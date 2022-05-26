import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../components/auction_item.dart';
import '../../../constants.dart';
import '../../../controller/auction_controller.dart';

class ScheduledAuctions extends StatelessWidget {
  ScheduledAuctions({Key? key}) : super(key: key);
  final controller = Get.find<AuctionController>();
  final RefreshController refreshController = RefreshController(
    initialRefresh: true,
  );
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuctionController>(
        init: AuctionController(anyFunc: 'scheduled'),
        builder: (context) {
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
                myAuction: controller.scheduledAuctions[index].myAuction,
              ),
            ),
          );
        });
  }
}
