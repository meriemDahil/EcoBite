// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      image: json['image'] as String?,
      points: (json['points'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
      'role': _$UserRoleEnumMap[instance.role]!,
      'address': instance.address,
      'phone': instance.phone,
      'image': instance.image,
      'points': instance.points,
    };

const _$UserRoleEnumMap = {
  UserRole.CUSTOMER: 'CUSTOMER',
  UserRole.RESTAURANT_OWNER: 'RESTAURANT_OWNER',
};
