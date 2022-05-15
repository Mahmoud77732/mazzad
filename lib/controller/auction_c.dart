import 'package:get/get.dart';
import 'package:mazzad/components/auction_item.dart';

class AuctionController extends GetxController {
  final List<AuctionItem> _auctions = <AuctionItem>[].obs;
  List<AuctionItem> get auctions => _auctions;
  AuctionController() {
    getAuctions();
  }

  getAuctions() async {}
}
