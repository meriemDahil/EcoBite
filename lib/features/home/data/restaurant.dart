import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class RestaurantModel with _$RestaurantModel {
  const factory RestaurantModel({
    required String id,
    required String restaurantName, // Restaurant name
    String? address,
    required String description,
    String? phone,
    String? image,
    String? openingTime,
    String? closingTime,
    double? rating,
    List<String>? menuItems,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}
