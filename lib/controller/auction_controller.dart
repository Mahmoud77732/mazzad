import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mazzad/components/auction_item.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/models/added_auction_model.dart';
import 'package:mazzad/services/auction_service.dart';

import '../models/auction/auction.dart';

class AuctionController extends GetxController {
  String? _liveAuctionNextPage;
  String? _scheduledAuctionNextPage;
  String? _upcomingAuctionNextPage;

  // AddedAuctionModel? addedAuctionModel = AddedAuctionModel();

  String? get liveAuctionNextPage => _liveAuctionNextPage;
  String? get scheduledAuctionNextPage => _scheduledAuctionNextPage;
  String? get upcomingAuctionNextPage => _upcomingAuctionNextPage;

  // recommended auctions in home screen
  List<AuctionItem> _recommendedAuctions = <AuctionItem>[].obs;
  List<AuctionItem> get recommendedAuctions => _recommendedAuctions;
  Rx<int> get recommendedAuctionsLength => _recommendedAuctions.length.obs;
  // for our live auctions
  List<AuctionItem> _liveAuctions = <AuctionItem>[].obs;
  List<AuctionItem> get liveAuctions => _liveAuctions;
  Rx<int> get liveAuctionsLength => _liveAuctions.length.obs;
  // for our scheduled auctions
  List<AuctionItem> _scheduledAuctions = <AuctionItem>[].obs;
  List<AuctionItem> get scheduledAuctions => _scheduledAuctions;
  Rx<int> get scheduledAuctionsLength => _scheduledAuctions.length.obs;

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

  void updateLiveNextPage({String? newNextPage}) {
    _liveAuctionNextPage = newNextPage;
    update();
  }

  void updateScheduledNextPage({String? newNextPage}) {
    _scheduledAuctionNextPage = newNextPage;
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
        cursor: '_liveAuctionNextPage',
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
        cursor: _scheduledAuctionNextPage,
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

  Future<bool>? postAuction(AddedAuctionModel? addedAuctionModel) async {
    try {
      // final myStaticJson = {
      //   "name": addedAuctionModel!.name,
      //   "images": addedAuctionModel.images![0],
      //   "type": addedAuctionModel.type,
      //   "start_date": addedAuctionModel.startDate,
      //   "end_date": addedAuctionModel.endDate,
      //   "description": addedAuctionModel.description,
      //   "category_id": addedAuctionModel.categoryId,
      //   "initial_price": addedAuctionModel.initialPrice,
      //   // "keywords": addedAuctionModel.keywords,
      //   "keywords": 'test',
      // };

      final myStaticJson = {
        "name": "ahmed",
        "images": ["uploads/1652037057wY3TFt1k.png"],
        "type": "live",
        "start_date": "2022-05-05T13:00",
        "end_date": "2022-05-25T14:00",
        "description": "HI there",
        "category_id": "1",
        "initial_price": "5",
        "keywords": ["hi", "bye", "olla"]
      };
      // print('---> myStaticJson: $myStaticJson');
      final response = await http.post(
        Uri.parse('${Constants.api}/auction'),
        body: jsonEncode(myStaticJson),
        headers: await Constants.headers,
      );
      if (kDebugMode) {
        print('my repsonse bodddddddddddddddddddddddddyyyyyyyyyyyyyyyyyyyyyy');
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        return true;
      } else {
        print('there is an err in updating user data');
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
