// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) {
  return _RestaurantModel.fromJson(json);
}

/// @nodoc
mixin _$RestaurantModel {
  String get id =>
      throw _privateConstructorUsedError; // Unique restaurant ID (could be linked to the user ID)
  String get restaurantName =>
      throw _privateConstructorUsedError; // Restaurant name
  String? get address =>
      throw _privateConstructorUsedError; // Address of the restaurant
  String? get phone =>
      throw _privateConstructorUsedError; // Restaurant phone number
  String? get image =>
      throw _privateConstructorUsedError; // Restaurant image URL
  String? get openingTime =>
      throw _privateConstructorUsedError; // Opening time (e.g., "09:00 AM")
  String? get closingTime =>
      throw _privateConstructorUsedError; // Closing time (e.g., "10:00 PM")
  double? get rating =>
      throw _privateConstructorUsedError; // Rating of the restaurant
  List<String>? get menuItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantModelCopyWith<RestaurantModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantModelCopyWith<$Res> {
  factory $RestaurantModelCopyWith(
          RestaurantModel value, $Res Function(RestaurantModel) then) =
      _$RestaurantModelCopyWithImpl<$Res, RestaurantModel>;
  @useResult
  $Res call(
      {String id,
      String restaurantName,
      String? address,
      String? phone,
      String? image,
      String? openingTime,
      String? closingTime,
      double? rating,
      List<String>? menuItems});
}

/// @nodoc
class _$RestaurantModelCopyWithImpl<$Res, $Val extends RestaurantModel>
    implements $RestaurantModelCopyWith<$Res> {
  _$RestaurantModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurantName = null,
    Object? address = freezed,
    Object? phone = freezed,
    Object? image = freezed,
    Object? openingTime = freezed,
    Object? closingTime = freezed,
    Object? rating = freezed,
    Object? menuItems = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      openingTime: freezed == openingTime
          ? _value.openingTime
          : openingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      closingTime: freezed == closingTime
          ? _value.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      menuItems: freezed == menuItems
          ? _value.menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantModelImplCopyWith<$Res>
    implements $RestaurantModelCopyWith<$Res> {
  factory _$$RestaurantModelImplCopyWith(_$RestaurantModelImpl value,
          $Res Function(_$RestaurantModelImpl) then) =
      __$$RestaurantModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String restaurantName,
      String? address,
      String? phone,
      String? image,
      String? openingTime,
      String? closingTime,
      double? rating,
      List<String>? menuItems});
}

/// @nodoc
class __$$RestaurantModelImplCopyWithImpl<$Res>
    extends _$RestaurantModelCopyWithImpl<$Res, _$RestaurantModelImpl>
    implements _$$RestaurantModelImplCopyWith<$Res> {
  __$$RestaurantModelImplCopyWithImpl(
      _$RestaurantModelImpl _value, $Res Function(_$RestaurantModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? restaurantName = null,
    Object? address = freezed,
    Object? phone = freezed,
    Object? image = freezed,
    Object? openingTime = freezed,
    Object? closingTime = freezed,
    Object? rating = freezed,
    Object? menuItems = freezed,
  }) {
    return _then(_$RestaurantModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      openingTime: freezed == openingTime
          ? _value.openingTime
          : openingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      closingTime: freezed == closingTime
          ? _value.closingTime
          : closingTime // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      menuItems: freezed == menuItems
          ? _value._menuItems
          : menuItems // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantModelImpl implements _RestaurantModel {
  const _$RestaurantModelImpl(
      {required this.id,
      required this.restaurantName,
      this.address,
      this.phone,
      this.image,
      this.openingTime,
      this.closingTime,
      this.rating,
      final List<String>? menuItems})
      : _menuItems = menuItems;

  factory _$RestaurantModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantModelImplFromJson(json);

  @override
  final String id;
// Unique restaurant ID (could be linked to the user ID)
  @override
  final String restaurantName;
// Restaurant name
  @override
  final String? address;
// Address of the restaurant
  @override
  final String? phone;
// Restaurant phone number
  @override
  final String? image;
// Restaurant image URL
  @override
  final String? openingTime;
// Opening time (e.g., "09:00 AM")
  @override
  final String? closingTime;
// Closing time (e.g., "10:00 PM")
  @override
  final double? rating;
// Rating of the restaurant
  final List<String>? _menuItems;
// Rating of the restaurant
  @override
  List<String>? get menuItems {
    final value = _menuItems;
    if (value == null) return null;
    if (_menuItems is EqualUnmodifiableListView) return _menuItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RestaurantModel(id: $id, restaurantName: $restaurantName, address: $address, phone: $phone, image: $image, openingTime: $openingTime, closingTime: $closingTime, rating: $rating, menuItems: $menuItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.openingTime, openingTime) ||
                other.openingTime == openingTime) &&
            (identical(other.closingTime, closingTime) ||
                other.closingTime == closingTime) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality()
                .equals(other._menuItems, _menuItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      restaurantName,
      address,
      phone,
      image,
      openingTime,
      closingTime,
      rating,
      const DeepCollectionEquality().hash(_menuItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantModelImplCopyWith<_$RestaurantModelImpl> get copyWith =>
      __$$RestaurantModelImplCopyWithImpl<_$RestaurantModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantModelImplToJson(
      this,
    );
  }
}

abstract class _RestaurantModel implements RestaurantModel {
  const factory _RestaurantModel(
      {required final String id,
      required final String restaurantName,
      final String? address,
      final String? phone,
      final String? image,
      final String? openingTime,
      final String? closingTime,
      final double? rating,
      final List<String>? menuItems}) = _$RestaurantModelImpl;

  factory _RestaurantModel.fromJson(Map<String, dynamic> json) =
      _$RestaurantModelImpl.fromJson;

  @override
  String get id;
  @override // Unique restaurant ID (could be linked to the user ID)
  String get restaurantName;
  @override // Restaurant name
  String? get address;
  @override // Address of the restaurant
  String? get phone;
  @override // Restaurant phone number
  String? get image;
  @override // Restaurant image URL
  String? get openingTime;
  @override // Opening time (e.g., "09:00 AM")
  String? get closingTime;
  @override // Closing time (e.g., "10:00 PM")
  double? get rating;
  @override // Rating of the restaurant
  List<String>? get menuItems;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantModelImplCopyWith<_$RestaurantModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
