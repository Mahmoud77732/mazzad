import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mazzad/components/auction_item.dart';
import 'package:mazzad/components/auction_status.dart';
import 'package:mazzad/models/auction/auction.dart';
import 'package:mazzad/services/auction_service.dart';

class AuctionsByUserIdController extends GetxController {
  final Rx<String?> _liveAuctionByUserIdNextPage = ''.obs;
  Rx<String?> get liveAuctionByUserIdNextPage => _liveAuctionByUserIdNextPage;
  final RxList<AuctionItem> _liveAuctionsByUserId = <AuctionItem>[].obs;
  Rx<int> get liveAuctionsByUserIdLength => _liveAuctionsByUserId.length.obs;
  List<AuctionItem> get liveAuctionsByUserId => _liveAuctionsByUserId;

  final Rx<String?> _scheduledAuctionByUserIdNextPage = ''.obs;
  Rx<String?> get scheduledAuctionByUserIdNextPage =>
      _scheduledAuctionByUserIdNextPage;
  final RxList<AuctionItem> _scheduledAuctionsByUserId = <AuctionItem>[].obs;
  Rx<int> get scheduledAuctionsByUserIdLength =>
      _scheduledAuctionsByUserId.length.obs;
  List<AuctionItem> get scheduledAuctionsByUserId => _scheduledAuctionsByUserId;

  AuctionsByUserIdController() {
    // getLiveAuctionsByUserId();
    // getScheduledAuctionsByUserId();
  }

  void updateLiveByUserIdNextPage({String? newNextPage}) {
    _liveAuctionByUserIdNextPage.value = newNextPage;
    update();
  }

  void updateScheduledByUserIdNextPage({String? newNextPage}) {
    _scheduledAuctionByUserIdNextPage.value = newNextPage;
    update();
  }

  Future<bool> getLiveAuctionsByUserId({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        if (kDebugMode) {
          print(
              'getting the live auctions for the first time and store it in the controller');
        }
        List<Auction> allAuctions = await AuctionService.getAuctionsByUserId(
          type: Status.live,
        );
        _liveAuctionsByUserId.value = allAuctions
            .map(
              (e) => AuctionItem(
                myAuction: Auction(
                  id: e.id,
                  category_id: e.category_id,
                  name: e.name,
                  description: e.description,
                  images: e.images,
                  initial_price: e.initial_price,
                  start_date: e.start_date,
                  end_date: e.end_date,
                  type: Status.live,
                  keywords: e.keywords,
                ),
              ),
            )
            .toList();
        update();
      } else {
        if (kDebugMode) {
          print(
              'add the new live auctions to the extisting one in the controller');
        }
        List<Auction> allAuctions = await AuctionService.getAuctions(
          type: Status.live,
          cursor: _liveAuctionByUserIdNextPage.value,
        );
        _liveAuctionsByUserId.addAll(allAuctions
            .map(
              (e) => AuctionItem(
                myAuction: Auction(
                    id: e.id,
                    category_id: e.category_id,
                    name: e.name,
                    description: e.description,
                    images: e.images,
                    initial_price: e.initial_price,
                    start_date: e.start_date,
                    end_date: e.end_date,
                    type: Status.live,
                    keywords: e.keywords),
              ),
            )
            .toList());
        update();
      }

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getScheduledAuctionsByUserId({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        if (kDebugMode) {
          print(
              'getting the live auctions for the first time and store it in the controller');
        }
        List<Auction> allAuctions = await AuctionService.getAuctionsByUserId(
          type: Status.scheduled,
        );
        _scheduledAuctionsByUserId.value = allAuctions
            .map(
              (e) => AuctionItem(
                myAuction: Auction(
                  id: e.id,
                  category_id: e.category_id,
                  name: e.name,
                  description: e.description,
                  images: e.images,
                  initial_price: e.initial_price,
                  start_date: e.start_date,
                  end_date: e.end_date,
                  type: Status.scheduled,
                  keywords: e.keywords,
                ),
              ),
            )
            .toList();
        update();
      } else {
        if (kDebugMode) {
          print(
              'add the new live auctions to the extisting one in the controller');
        }
        List<Auction> allAuctions = await AuctionService.getAuctions(
          type: Status.live,
          cursor: _scheduledAuctionByUserIdNextPage.value,
        );
        _scheduledAuctionsByUserId.addAll(allAuctions
            .map(
              (e) => AuctionItem(
                myAuction: Auction(
                    id: e.id,
                    category_id: e.category_id,
                    name: e.name,
                    description: e.description,
                    images: e.images,
                    initial_price: e.initial_price,
                    start_date: e.start_date,
                    end_date: e.end_date,
                    type: Status.scheduled,
                    keywords: e.keywords),
              ),
            )
            .toList());
        update();
      }

      return true;
    } catch (e) {
      rethrow;
    }
  }
}
