// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantImpl _$$RestaurantImplFromJson(Map<String, dynamic> json) =>
    _$RestaurantImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      restaurantOwner: json['restaurantOwner'] == null
          ? null
          : UserModel.fromJson(json['restaurantOwner'] as Map<String, dynamic>),
      address: json['address'] as String,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String,
      openTime: json['openTime'] as String,
      closeTime: json['closeTime'] as String,
      phone: json['phone'] as String?,
      website: json['website'] as String?,
      socialMedia: (json['socialMedia'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      likesCount: (json['likesCount'] as num?)?.toInt(),
      commentsCount: (json['commentsCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RestaurantImplToJson(_$RestaurantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'restaurantOwner': instance.restaurantOwner?.toJson(),
      'address': instance.address,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'phone': instance.phone,
      'website': instance.website,
      'socialMedia': instance.socialMedia,
      'likesCount': instance.likesCount,
      'commentsCount': instance.commentsCount,
    };
