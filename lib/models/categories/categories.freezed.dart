// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'categories.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Categories _$CategoriesFromJson(Map<String, dynamic> json) {
  return _Categories.fromJson(json);
}

/// @nodoc
mixin _$Categories {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get icon_name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoriesCopyWith<Categories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesCopyWith<$Res> {
  factory $CategoriesCopyWith(
          Categories value, $Res Function(Categories) then) =
      _$CategoriesCopyWithImpl<$Res>;
  $Res call({int? id, String? title, String? icon_name});
}

/// @nodoc
class _$CategoriesCopyWithImpl<$Res> implements $CategoriesCopyWith<$Res> {
  _$CategoriesCopyWithImpl(this._value, this._then);

  final Categories _value;
  // ignore: unused_field
  final $Res Function(Categories) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? icon_name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      icon_name: icon_name == freezed
          ? _value.icon_name
          : icon_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CategoriesCopyWith<$Res> implements $CategoriesCopyWith<$Res> {
  factory _$CategoriesCopyWith(
          _Categories value, $Res Function(_Categories) then) =
      __$CategoriesCopyWithImpl<$Res>;
  @override
  $Res call({int? id, String? title, String? icon_name});
}

/// @nodoc
class __$CategoriesCopyWithImpl<$Res> extends _$CategoriesCopyWithImpl<$Res>
    implements _$CategoriesCopyWith<$Res> {
  __$CategoriesCopyWithImpl(
      _Categories _value, $Res Function(_Categories) _then)
      : super(_value, (v) => _then(v as _Categories));

  @override
  _Categories get _value => super._value as _Categories;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? icon_name = freezed,
  }) {
    return _then(_Categories(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      icon_name: icon_name == freezed
          ? _value.icon_name
          : icon_name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Categories implements _Categories {
  const _$_Categories({this.id, this.title, this.icon_name});

  factory _$_Categories.fromJson(Map<String, dynamic> json) =>
      _$$_CategoriesFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? icon_name;

  @override
  String toString() {
    return 'Categories(id: $id, title: $title, icon_name: $icon_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Categories &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.icon_name, icon_name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(icon_name));

  @JsonKey(ignore: true)
  @override
  _$CategoriesCopyWith<_Categories> get copyWith =>
      __$CategoriesCopyWithImpl<_Categories>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoriesToJson(this);
  }
}

abstract class _Categories implements Categories {
  const factory _Categories(
      {final int? id,
      final String? title,
      final String? icon_name}) = _$_Categories;

  factory _Categories.fromJson(Map<String, dynamic> json) =
      _$_Categories.fromJson;

  @override
  int? get id => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  String? get icon_name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CategoriesCopyWith<_Categories> get copyWith =>
      throw _privateConstructorUsedError;
}
