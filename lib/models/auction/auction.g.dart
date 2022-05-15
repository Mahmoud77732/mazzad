// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Auction _$$_AuctionFromJson(Map<String, dynamic> json) => _$_Auction(
      category_id: json['category_id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      initial_price: (json['initial_price'] as num).toDouble(),
      start_date: DateTime.parse(json['start_date'] as String),
      type: $enumDecode(_$StatusEnumMap, json['type']),
    );

Map<String, dynamic> _$$_AuctionToJson(_$_Auction instance) =>
    <String, dynamic>{
      'category_id': instance.category_id,
      'name': instance.name,
      'description': instance.description,
      'initial_price': instance.initial_price,
      'start_date': instance.start_date.toIso8601String(),
      'type': _$StatusEnumMap[instance.type],
    };

const _$StatusEnumMap = {
  Status.live: 'live',
  Status.scheuled: 'scheuled',
  Status.soon: 'soon',
};
