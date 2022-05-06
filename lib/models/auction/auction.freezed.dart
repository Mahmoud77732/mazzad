// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Auction _$AuctionFromJson(Map<String, dynamic> json) {
  return _Auction.fromJson(json);
}

/// @nodoc
mixin _$Auction {
  int get category_id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get initial_price => throw _privateConstructorUsedError;
  DateTime get start_date => throw _privateConstructorUsedError;
  Status get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuctionCopyWith<Auction> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuctionCopyWith<$Res> {
  factory $AuctionCopyWith(Auction value, $Res Function(Auction) then) =
      _$AuctionCopyWithImpl<$Res>;
  $Res call(
      {int category_id,
      String name,
      String description,
      double initial_price,
      DateTime start_date,
      Status type});
}

/// @nodoc
class _$AuctionCopyWithImpl<$Res> implements $AuctionCopyWith<$Res> {
  _$AuctionCopyWithImpl(this._value, this._then);

  final Auction _value;
  // ignore: unused_field
  final $Res Function(Auction) _then;

  @override
  $Res call({
    Object? category_id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? initial_price = freezed,
    Object? start_date = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      category_id: category_id == freezed
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      initial_price: initial_price == freezed
          ? _value.initial_price
          : initial_price // ignore: cast_nullable_to_non_nullable
              as double,
      start_date: start_date == freezed
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc
abstract class _$AuctionCopyWith<$Res> implements $AuctionCopyWith<$Res> {
  factory _$AuctionCopyWith(_Auction value, $Res Function(_Auction) then) =
      __$AuctionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int category_id,
      String name,
      String description,
      double initial_price,
      DateTime start_date,
      Status type});
}

/// @nodoc
class __$AuctionCopyWithImpl<$Res> extends _$AuctionCopyWithImpl<$Res>
    implements _$AuctionCopyWith<$Res> {
  __$AuctionCopyWithImpl(_Auction _value, $Res Function(_Auction) _then)
      : super(_value, (v) => _then(v as _Auction));

  @override
  _Auction get _value => super._value as _Auction;

  @override
  $Res call({
    Object? category_id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? initial_price = freezed,
    Object? start_date = freezed,
    Object? type = freezed,
  }) {
    return _then(_Auction(
      category_id: category_id == freezed
          ? _value.category_id
          : category_id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      initial_price: initial_price == freezed
          ? _value.initial_price
          : initial_price // ignore: cast_nullable_to_non_nullable
              as double,
      start_date: start_date == freezed
          ? _value.start_date
          : start_date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Auction extends _Auction {
  const _$_Auction(
      {required this.category_id,
      required this.name,
      required this.description,
      required this.initial_price,
      required this.start_date,
      required this.type})
      : super._();

  factory _$_Auction.fromJson(Map<String, dynamic> json) =>
      _$$_AuctionFromJson(json);

  @override
  final int category_id;
  @override
  final String name;
  @override
  final String description;
  @override
  final double initial_price;
  @override
  final DateTime start_date;
  @override
  final Status type;

  @override
  String toString() {
    return 'Auction(category_id: $category_id, name: $name, description: $description, initial_price: $initial_price, start_date: $start_date, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Auction &&
            const DeepCollectionEquality()
                .equals(other.category_id, category_id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality()
                .equals(other.initial_price, initial_price) &&
            const DeepCollectionEquality()
                .equals(other.start_date, start_date) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(category_id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(initial_price),
      const DeepCollectionEquality().hash(start_date),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$AuctionCopyWith<_Auction> get copyWith =>
      __$AuctionCopyWithImpl<_Auction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuctionToJson(this);
  }
}

abstract class _Auction extends Auction {
  const factory _Auction(
      {required final int category_id,
      required final String name,
      required final String description,
      required final double initial_price,
      required final DateTime start_date,
      required final Status type}) = _$_Auction;
  const _Auction._() : super._();

  factory _Auction.fromJson(Map<String, dynamic> json) = _$_Auction.fromJson;

  @override
  int get category_id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  double get initial_price => throw _privateConstructorUsedError;
  @override
  DateTime get start_date => throw _privateConstructorUsedError;
  @override
  Status get type => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuctionCopyWith<_Auction> get copyWith =>
      throw _privateConstructorUsedError;
}
