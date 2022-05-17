import 'package:get/get.dart';
import 'package:mazzad/components/auction_item.dart';
import 'package:mazzad/services/auction_service.dart';

import '../models/auction/auction.dart';

class AuctionController extends GetxController {
  List<AuctionItem> _auctions = <AuctionItem>[].obs;
  List<AuctionItem> get auctions => _auctions;
  int get length => _auctions.length;
  AuctionController() {
    getAuctions();
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
