import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with _$Restaurant {
  @JsonSerializable(explicitToJson: true)
  factory Restaurant({
    required String id,
    required String name,
    UserModel? restaurantOwner,
    required String address,
    String? description,
    required String imageUrl,
    required String openTime,
    required String closeTime,
    String? phone,
    String? website,
    Map<String, String>? socialMedia,
    int? likesCount,
    int? commentsCount,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) => _$RestaurantFromJson(json);
}
