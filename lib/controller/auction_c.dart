import 'package:get/get.dart';
import 'package:mazzad/components/auction_item.dart';
import 'package:mazzad/services/auction_service.dart';

import '../models/auction/auction.dart';

class AuctionController extends GetxController {
  List<AuctionItem> _auctions = <AuctionItem>[].obs;
  List<AuctionItem> get auctions => _auctions;
  String? _auctionType;
  String? get auctionType => _auctionType;
  int get length => _auctions.length;
  int _categoryId = -1;
  int get categoryId => _categoryId;
  AuctionController() {
    getAuctions();
  }

  void updateAuctionName({String? newAuctionType}) {
    _auctionType = newAuctionType;
    update();
  }

  void updateCategoryAcutionId({int? mySelectedCategoryId}) {
    _categoryId = mySelectedCategoryId ?? -1;
    update();
  }

  Future<List<AuctionItem>> getAuctions() async {
    try {
      List<Auction> allAuctions = await AuctionService.getAuctions();
      _auctions = allAuctions
          .map(
            (e) => AuctionItem(
              name: e.name,
              image: e.initial_price.toString(),
              currentBid: e.initial_price,
              status: e.type,
            ),
          )
          .toList();
      print('object');
      print(_auctions);
      update();
      return _auctions;
    } catch (e) {
      rethrow;
    }
  }
}
