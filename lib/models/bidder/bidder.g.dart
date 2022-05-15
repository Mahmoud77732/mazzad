// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bidder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bidder _$$_BidderFromJson(Map<String, dynamic> json) => _$_Bidder(
      name: json['name'] as String?,
      price: json['price'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_BidderToJson(_$_Bidder instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'date': instance.date?.toIso8601String(),
      'image': instance.image,
    };
