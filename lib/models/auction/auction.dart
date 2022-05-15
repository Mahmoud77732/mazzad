import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mazzad/components/auction_item.dart';

part 'auction.freezed.dart';
part 'auction.g.dart';

@freezed
class Auction with _$Auction {
  const Auction._();

  const factory Auction({
    required int category_id,
    required String name,
    required String description,
    required double initial_price,
    required DateTime start_date,
    required Status type,
  }) = _Auction;

  factory Auction.fromJson(Map<String, dynamic> json) =>
      _$AuctionFromJson(json);
}

/*
{
    "name":"allaaaaaaaaa",
    "description":"Ibrahim is donkey",
    "category_id":"1",
    "initial_price":"1",
    "type":"live",
    "start_date":"2022/05/05"
}
*/