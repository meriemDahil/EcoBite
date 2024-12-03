// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OfferModelImpl _$$OfferModelImplFromJson(Map<String, dynamic> json) =>
    _$OfferModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
      imagePath: json['imagePath'] as String,
      restaurant: json['restaurant'] == null
          ? null
          : RestaurantModel.fromJson(
              json['restaurant'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$OfferModelImplToJson(_$OfferModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'expiryDate': instance.expiryDate?.toIso8601String(),
      'imagePath': instance.imagePath,
      'restaurant': instance.restaurant,
      'user': instance.user,
      'quantity': instance.quantity,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
