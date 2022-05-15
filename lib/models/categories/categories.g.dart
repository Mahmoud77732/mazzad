// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Categories _$$_CategoriesFromJson(Map<String, dynamic> json) =>
    _$_Categories(
      id: json['id'] as int?,
      name: json['name'] as String?,
      icon: json['icon'].toString().substring(8),
    );

Map<String, dynamic> _$$_CategoriesToJson(_$_Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };
