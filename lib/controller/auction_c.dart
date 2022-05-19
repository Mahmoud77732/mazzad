import 'package:get/get.dart';
import 'package:mazzad/components/auction_item.dart';
import 'package:mazzad/services/auction_service.dart';

import '../models/auction/auction.dart';

class AuctionController extends GetxController {
  // recommended auctions in home screen
  List<AuctionItem> _recommendedAuctions = <AuctionItem>[].obs;
  List<AuctionItem> get recommendedAuctions => _recommendedAuctions;
  int get recommendedAuctionsLength => _recommendedAuctions.length;
  // for our live auctions
  List<AuctionItem> _liveAuctions = <AuctionItem>[].obs;
  List<AuctionItem> get liveAuctions => _liveAuctions;
  int get liveAuctionsLength => _liveAuctions.length;
  // for our scheduled auctions
  List<AuctionItem> _scheduledAuctions = <AuctionItem>[].obs;
  List<AuctionItem> get scheduledAuctions => _scheduledAuctions;
  int get scheduledAuctionsLength => _scheduledAuctions.length;
  String? _auctionType;
  String? get auctionType => _auctionType;
  int _categoryId = -1;
  int get categoryId => _categoryId;
  AuctionController() {
    getRecommendedAuctions();
    getLiveAuctions();
    getScheduledAuctions();
  }
  // to get the auction type
  void updateAuctionName({String? newAuctionType}) {
    _auctionType = newAuctionType;
    update();
  }

  // to get the auction cat id
  void updateCategoryAcutionId({int? mySelectedCategoryId}) {
    _categoryId = mySelectedCategoryId ?? -1;
    update();
  }

  Future<List<AuctionItem>> getLiveAuctions() async {
    try {
      List<Auction> allAuctions = await AuctionService.getAuctions(
        type: Status.live,
      );
      _liveAuctions = allAuctions
          .map(
            (e) => AuctionItem(
              name: e.name,
              image: e.images,
              currentBid: e.initial_price,
              status: e.type,
            ),
          )
          .toList();
      update();
      return _liveAuctions;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AuctionItem>> getScheduledAuctions() async {
    try {
      List<Auction> allAuctions = await AuctionService.getAuctions(
        type: Status.scheduled,
      );
      _scheduledAuctions = allAuctions
          .map(
            (e) => AuctionItem(
              name: e.name,
              image: e.images,
              currentBid: e.initial_price,
              status: e.type,
            ),
          )
          .toList();
      update();
      return _scheduledAuctions;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<AuctionItem>> getRecommendedAuctions() async {
    try {
      List<Auction> allAuctions = await AuctionService.getAuctions(
        limit: '10',
      );
      _recommendedAuctions = allAuctions
          .map(
            (e) => AuctionItem(
              name: e.name,
              image: e.images,
              currentBid: e.initial_price,
              status: e.type,
            ),
          )
          .toList();
      update();
      return _recommendedAuctions;
    } catch (e) {
      rethrow;
    }
  }
}
