// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantModelImpl _$$RestaurantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RestaurantModelImpl(
      id: json['id'] as String,
      restaurantName: json['restaurantName'] as String,
      address: json['address'] as String?,
      description: json['description'] as String,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      openingTime: json['openingTime'] as String?,
      closingTime: json['closingTime'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      menuItems: (json['menuItems'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$RestaurantModelImplToJson(
        _$RestaurantModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurantName': instance.restaurantName,
      'address': instance.address,
      'description': instance.description,
      'phone': instance.phone,
      'image': instance.image,
      'openingTime': instance.openingTime,
      'closingTime': instance.closingTime,
      'rating': instance.rating,
      'menuItems': instance.menuItems,
    };
