import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/auction/auction.dart';

class AuctionService {
  Future<List<Auction>> postAuction(Auction auction) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.api}/auction'),
        body: jsonEncode(auction.toJson()),
        headers: await Constants.profileHeader,
      );
      if (response.statusCode == 200) {
        final resbody = json.decode(response.body);
        return (resbody as Iterable)
            .map((e) => Auction.fromJson(e['data']))
            .toList();
      } else {
        print("postAuction: ${response.statusCode}");
        print("postAuction: ${response.body}");
        throw 'can\'t fetch the auctions from the server';
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Auction>> getAuctions() async {
    try {
      final response = await http.get(
        Uri.parse('${Constants.api}/auction/'),
        headers: await Constants.profileHeader,
      );
      if (response.statusCode == 200) {
        final resbody = json.decode(response.body);
        return (resbody['data'] as Iterable)
            .map((e) => Auction.fromJson(e))
            .toList();
      } else {
        throw 'can\'t fetch the auctions from the server';
      }
    } catch (e) {
      rethrow;
    }
  }
}
