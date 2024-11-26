import 'package:freezed_annotation/freezed_annotation.dart';
part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed

class RestaurantModel with _$RestaurantModel {
  const factory RestaurantModel({
    required String id,                    // Unique restaurant ID (could be linked to the user ID)
    required String restaurantName,        // Restaurant name
    String? address,                      // Address of the restaurant
    String? phone,                        // Restaurant phone number
    String? image,                        // Restaurant image URL
    String? openingTime,                  // Opening time (e.g., "09:00 AM")
    String? closingTime,                  // Closing time (e.g., "10:00 PM")
    double? rating,                       // Rating of the restaurant
    List<String>? menuItems,              // List of menu items (optional)
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) => _$RestaurantModelFromJson(json);
}
