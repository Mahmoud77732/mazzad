// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bidder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Bidder _$BidderFromJson(Map<String, dynamic> json) {
  return _Bidder.fromJson(json);
}

/// @nodoc
mixin _$Bidder {
  String? get name => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BidderCopyWith<Bidder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BidderCopyWith<$Res> {
  factory $BidderCopyWith(Bidder value, $Res Function(Bidder) then) =
      _$BidderCopyWithImpl<$Res>;
  $Res call({String? name, String? price, DateTime? date, String? image});
}

/// @nodoc
class _$BidderCopyWithImpl<$Res> implements $BidderCopyWith<$Res> {
  _$BidderCopyWithImpl(this._value, this._then);

  final Bidder _value;
  // ignore: unused_field
  final $Res Function(Bidder) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? date = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_BidderCopyWith<$Res> implements $BidderCopyWith<$Res> {
  factory _$$_BidderCopyWith(_$_Bidder value, $Res Function(_$_Bidder) then) =
      __$$_BidderCopyWithImpl<$Res>;
  @override
  $Res call({String? name, String? price, DateTime? date, String? image});
}

/// @nodoc
class __$$_BidderCopyWithImpl<$Res> extends _$BidderCopyWithImpl<$Res>
    implements _$$_BidderCopyWith<$Res> {
  __$$_BidderCopyWithImpl(_$_Bidder _value, $Res Function(_$_Bidder) _then)
      : super(_value, (v) => _then(v as _$_Bidder));

  @override
  _$_Bidder get _value => super._value as _$_Bidder;

  @override
  $Res call({
    Object? name = freezed,
    Object? price = freezed,
    Object? date = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_Bidder(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bidder implements _Bidder {
  const _$_Bidder({this.name, this.price, this.date, this.image});

  factory _$_Bidder.fromJson(Map<String, dynamic> json) =>
      _$$_BidderFromJson(json);

  @override
  final String? name;
  @override
  final String? price;
  @override
  final DateTime? date;
  @override
  final String? image;

  @override
  String toString() {
    return 'Bidder(name: $name, price: $price, date: $date, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bidder &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(image));

  @JsonKey(ignore: true)
  @override
  _$$_BidderCopyWith<_$_Bidder> get copyWith =>
      __$$_BidderCopyWithImpl<_$_Bidder>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BidderToJson(this);
  }
}

abstract class _Bidder implements Bidder {
  const factory _Bidder(
      {final String? name,
      final String? price,
      final DateTime? date,
      final String? image}) = _$_Bidder;

  factory _Bidder.fromJson(Map<String, dynamic> json) = _$_Bidder.fromJson;

  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get price => throw _privateConstructorUsedError;
  @override
  DateTime? get date => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_BidderCopyWith<_$_Bidder> get copyWith =>
      throw _privateConstructorUsedError;
}
