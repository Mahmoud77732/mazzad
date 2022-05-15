import 'package:freezed_annotation/freezed_annotation.dart';

part 'bidder.freezed.dart';
part 'bidder.g.dart';

@freezed
class Bidder with _$Bidder {
  const factory Bidder({
    final String? name,
    final String? price,
    final DateTime? date,
    final String? image,
  }) = _Bidder;

  factory Bidder.fromJson(Map<String, dynamic> json) => _$BidderFromJson(json);
}
