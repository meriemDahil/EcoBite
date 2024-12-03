// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) {
  return _OfferModel.fromJson(json);
}

/// @nodoc
mixin _$OfferModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  RestaurantModel? get restaurant => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferModelCopyWith<OfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferModelCopyWith<$Res> {
  factory $OfferModelCopyWith(
          OfferModel value, $Res Function(OfferModel) then) =
      _$OfferModelCopyWithImpl<$Res, OfferModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      double price,
      DateTime? expiryDate,
      String imagePath,
      RestaurantModel? restaurant,
      UserModel? user,
      int quantity,
      DateTime? createdAt});

  $RestaurantModelCopyWith<$Res>? get restaurant;
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$OfferModelCopyWithImpl<$Res, $Val extends OfferModel>
    implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? expiryDate = freezed,
    Object? imagePath = null,
    Object? restaurant = freezed,
    Object? user = freezed,
    Object? quantity = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant: freezed == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as RestaurantModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RestaurantModelCopyWith<$Res>? get restaurant {
    if (_value.restaurant == null) {
      return null;
    }

    return $RestaurantModelCopyWith<$Res>(_value.restaurant!, (value) {
      return _then(_value.copyWith(restaurant: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OfferModelImplCopyWith<$Res>
    implements $OfferModelCopyWith<$Res> {
  factory _$$OfferModelImplCopyWith(
          _$OfferModelImpl value, $Res Function(_$OfferModelImpl) then) =
      __$$OfferModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      double price,
      DateTime? expiryDate,
      String imagePath,
      RestaurantModel? restaurant,
      UserModel? user,
      int quantity,
      DateTime? createdAt});

  @override
  $RestaurantModelCopyWith<$Res>? get restaurant;
  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$OfferModelImplCopyWithImpl<$Res>
    extends _$OfferModelCopyWithImpl<$Res, _$OfferModelImpl>
    implements _$$OfferModelImplCopyWith<$Res> {
  __$$OfferModelImplCopyWithImpl(
      _$OfferModelImpl _value, $Res Function(_$OfferModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? expiryDate = freezed,
    Object? imagePath = null,
    Object? restaurant = freezed,
    Object? user = freezed,
    Object? quantity = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$OfferModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      restaurant: freezed == restaurant
          ? _value.restaurant
          : restaurant // ignore: cast_nullable_to_non_nullable
              as RestaurantModel?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferModelImpl implements _OfferModel {
  const _$OfferModelImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      this.expiryDate,
      required this.imagePath,
      this.restaurant,
      this.user,
      required this.quantity,
      this.createdAt});

  factory _$OfferModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final double price;
  @override
  final DateTime? expiryDate;
  @override
  final String imagePath;
  @override
  final RestaurantModel? restaurant;
  @override
  final UserModel? user;
  @override
  final int quantity;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'OfferModel(id: $id, title: $title, description: $description, price: $price, expiryDate: $expiryDate, imagePath: $imagePath, restaurant: $restaurant, user: $user, quantity: $quantity, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, price,
      expiryDate, imagePath, restaurant, user, quantity, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferModelImplCopyWith<_$OfferModelImpl> get copyWith =>
      __$$OfferModelImplCopyWithImpl<_$OfferModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferModelImplToJson(
      this,
    );
  }
}

abstract class _OfferModel implements OfferModel {
  const factory _OfferModel(
      {required final String id,
      required final String title,
      required final String description,
      required final double price,
      final DateTime? expiryDate,
      required final String imagePath,
      final RestaurantModel? restaurant,
      final UserModel? user,
      required final int quantity,
      final DateTime? createdAt}) = _$OfferModelImpl;

  factory _OfferModel.fromJson(Map<String, dynamic> json) =
      _$OfferModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  double get price;
  @override
  DateTime? get expiryDate;
  @override
  String get imagePath;
  @override
  RestaurantModel? get restaurant;
  @override
  UserModel? get user;
  @override
  int get quantity;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$OfferModelImplCopyWith<_$OfferModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
