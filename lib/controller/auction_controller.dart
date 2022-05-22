import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mazzad/components/auction_item.dart';
import 'package:mazzad/constants.dart';
import 'package:mazzad/services/auction_service.dart';

import '../models/auction/auction.dart';

class AuctionController extends GetxController {
  final Rx<String?> _liveAuctionNextPage = ''.obs;
  final Rx<String?> _scheduledAuctionNextPage = ''.obs;
  final Rx<String?> _upcomingAuctionNextPage = ''.obs;

  Rx<String?> get liveAuctionNextPage => _liveAuctionNextPage;
  Rx<String?> get scheduledAuctionNextPage => _scheduledAuctionNextPage;
  Rx<String?> get upcomingAuctionNextPage => _upcomingAuctionNextPage;

  // recommended auctions in home screen
  List<AuctionItem> _recommendedAuctions = <AuctionItem>[].obs;
  List<AuctionItem> get recommendedAuctions => _recommendedAuctions;
  Rx<int> get recommendedAuctionsLength => _recommendedAuctions.length.obs;
  // for our live auctions
  final RxList<AuctionItem> _liveAuctions = <AuctionItem>[].obs;
  List<AuctionItem> get liveAuctions => _liveAuctions;
  Rx<int> get liveAuctionsLength =>
      _liveAuctions.length.obs; //> 15 ? 0.obs : _liveAuctions.length.obs
  // for our scheduled auctions
  List<AuctionItem> _scheduledAuctions = <AuctionItem>[].obs;
  List<AuctionItem> get scheduledAuctions => _scheduledAuctions;
  Rx<int> get scheduledAuctionsLength => _scheduledAuctions.length.obs;
  ScrollController controller = ScrollController();

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
    _liveAuctionNextPage.value = newNextPage;
    update();
  }

  void updateScheduledNextPage({String? newNextPage}) {
    _scheduledAuctionNextPage.value = newNextPage;
    update();
  }

  // to get the auction cat id
  void updateCategoryAcutionId({int? mySelectedCategoryId}) {
    _categoryId = mySelectedCategoryId ?? -1;
    update();
  }

  Future<bool> getLiveAuctions({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        if (kDebugMode) {
          print(
              'getting the live auctions for the first time and store it in the controller');
        }
        List<Auction> allAuctions = await AuctionService.getAuctions(
          type: Status.live,
        );
        _liveAuctions.value = allAuctions
            .map(
              (e) => AuctionItem(
                name: e.name,
                description: e.description,
                image: e.images,
                currentBid: e.initial_price,
                status: e.type,
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
          cursor: _liveAuctionNextPage.value,
        );
        _liveAuctions.addAll(allAuctions
            .map(
              (e) => AuctionItem(
                name: e.name,
                description: e.description,
                image: e.images,
                currentBid: e.initial_price,
                status: e.type,
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

  Future<bool> getScheduledAuctions({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        if (kDebugMode) {
          print(
              'getting the scheduled auctions for the first time and store it in the controller');
        }
        List<Auction> allAuctions = await AuctionService.getAuctions(
          type: Status.scheduled,
        );
        _scheduledAuctions = allAuctions
            .map(
              (e) => AuctionItem(
                name: e.name,
                description: e.description,
                image: e.images,
                currentBid: e.initial_price,
                status: e.type,
              ),
            )
            .toList();
        update();
        return true;
      } else {
        if (kDebugMode) {
          print(
              'add the new scheduled auctions to the extisting one in the controller');
        }
        List<Auction> allAuctions = await AuctionService.getAuctions(
          type: Status.scheduled,
          cursor: _scheduledAuctionNextPage.value,
        );
        _scheduledAuctions.addAll(
          allAuctions
              .map(
                (e) => AuctionItem(
                  name: e.name,
                  description: e.description,
                  image: e.images,
                  currentBid: e.initial_price,
                  status: e.type,
                ),
              )
              .toList(),
        );

        update();
        return true;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> getRecommendedAuctions() async {
    try {
      List<Auction> allAuctions = await AuctionService.getAuctions(limit: '10');
      _recommendedAuctions = allAuctions
          .map(
            (e) => AuctionItem(
              name: e.name,
              description: e.description,
              image: e.images,
              currentBid: e.initial_price,
              status: e.type,
            ),
          )
          .toList();
      update();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool>? postAuction(Auction addedAuctionModel) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.api}/auction'),
        body: jsonEncode(addedAuctionModel.toJson()),
        headers: await Constants.headers,
      );
      print(response.body);
      if (kDebugMode) {
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
