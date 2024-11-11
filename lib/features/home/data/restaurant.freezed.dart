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

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  UserModel? get restaurantOwner => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get openTime => throw _privateConstructorUsedError;
  String get closeTime => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;
  Map<String, String>? get socialMedia => throw _privateConstructorUsedError;
  int? get likesCount => throw _privateConstructorUsedError;
  int? get commentsCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res, Restaurant>;
  @useResult
  $Res call(
      {String id,
      String name,
      UserModel? restaurantOwner,
      String address,
      String? description,
      String imageUrl,
      String openTime,
      String closeTime,
      String? phone,
      String? website,
      Map<String, String>? socialMedia,
      int? likesCount,
      int? commentsCount});

  $UserModelCopyWith<$Res>? get restaurantOwner;
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res, $Val extends Restaurant>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? restaurantOwner = freezed,
    Object? address = null,
    Object? description = freezed,
    Object? imageUrl = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? phone = freezed,
    Object? website = freezed,
    Object? socialMedia = freezed,
    Object? likesCount = freezed,
    Object? commentsCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantOwner: freezed == restaurantOwner
          ? _value.restaurantOwner
          : restaurantOwner // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      socialMedia: freezed == socialMedia
          ? _value.socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      commentsCount: freezed == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get restaurantOwner {
    if (_value.restaurantOwner == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.restaurantOwner!, (value) {
      return _then(_value.copyWith(restaurantOwner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantImplCopyWith<$Res>
    implements $RestaurantCopyWith<$Res> {
  factory _$$RestaurantImplCopyWith(
          _$RestaurantImpl value, $Res Function(_$RestaurantImpl) then) =
      __$$RestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      UserModel? restaurantOwner,
      String address,
      String? description,
      String imageUrl,
      String openTime,
      String closeTime,
      String? phone,
      String? website,
      Map<String, String>? socialMedia,
      int? likesCount,
      int? commentsCount});

  @override
  $UserModelCopyWith<$Res>? get restaurantOwner;
}

/// @nodoc
class __$$RestaurantImplCopyWithImpl<$Res>
    extends _$RestaurantCopyWithImpl<$Res, _$RestaurantImpl>
    implements _$$RestaurantImplCopyWith<$Res> {
  __$$RestaurantImplCopyWithImpl(
      _$RestaurantImpl _value, $Res Function(_$RestaurantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? restaurantOwner = freezed,
    Object? address = null,
    Object? description = freezed,
    Object? imageUrl = null,
    Object? openTime = null,
    Object? closeTime = null,
    Object? phone = freezed,
    Object? website = freezed,
    Object? socialMedia = freezed,
    Object? likesCount = freezed,
    Object? commentsCount = freezed,
  }) {
    return _then(_$RestaurantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantOwner: freezed == restaurantOwner
          ? _value.restaurantOwner
          : restaurantOwner // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      openTime: null == openTime
          ? _value.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      closeTime: null == closeTime
          ? _value.closeTime
          : closeTime // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
      socialMedia: freezed == socialMedia
          ? _value._socialMedia
          : socialMedia // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      commentsCount: freezed == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$RestaurantImpl implements _Restaurant {
  _$RestaurantImpl(
      {required this.id,
      required this.name,
      this.restaurantOwner,
      required this.address,
      this.description,
      required this.imageUrl,
      required this.openTime,
      required this.closeTime,
      this.phone,
      this.website,
      final Map<String, String>? socialMedia,
      this.likesCount,
      this.commentsCount})
      : _socialMedia = socialMedia;

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final UserModel? restaurantOwner;
  @override
  final String address;
  @override
  final String? description;
  @override
  final String imageUrl;
  @override
  final String openTime;
  @override
  final String closeTime;
  @override
  final String? phone;
  @override
  final String? website;
  final Map<String, String>? _socialMedia;
  @override
  Map<String, String>? get socialMedia {
    final value = _socialMedia;
    if (value == null) return null;
    if (_socialMedia is EqualUnmodifiableMapView) return _socialMedia;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int? likesCount;
  @override
  final int? commentsCount;

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, restaurantOwner: $restaurantOwner, address: $address, description: $description, imageUrl: $imageUrl, openTime: $openTime, closeTime: $closeTime, phone: $phone, website: $website, socialMedia: $socialMedia, likesCount: $likesCount, commentsCount: $commentsCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.restaurantOwner, restaurantOwner) ||
                other.restaurantOwner == restaurantOwner) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.closeTime, closeTime) ||
                other.closeTime == closeTime) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.website, website) || other.website == website) &&
            const DeepCollectionEquality()
                .equals(other._socialMedia, _socialMedia) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      restaurantOwner,
      address,
      description,
      imageUrl,
      openTime,
      closeTime,
      phone,
      website,
      const DeepCollectionEquality().hash(_socialMedia),
      likesCount,
      commentsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      __$$RestaurantImplCopyWithImpl<_$RestaurantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantImplToJson(
      this,
    );
  }
}

abstract class _Restaurant implements Restaurant {
  factory _Restaurant(
      {required final String id,
      required final String name,
      final UserModel? restaurantOwner,
      required final String address,
      final String? description,
      required final String imageUrl,
      required final String openTime,
      required final String closeTime,
      final String? phone,
      final String? website,
      final Map<String, String>? socialMedia,
      final int? likesCount,
      final int? commentsCount}) = _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  UserModel? get restaurantOwner;
  @override
  String get address;
  @override
  String? get description;
  @override
  String get imageUrl;
  @override
  String get openTime;
  @override
  String get closeTime;
  @override
  String? get phone;
  @override
  String? get website;
  @override
  Map<String, String>? get socialMedia;
  @override
  int? get likesCount;
  @override
  int? get commentsCount;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
