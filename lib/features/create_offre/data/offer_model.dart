import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/home/data/restaurant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

@freezed
class OfferModel with _$OfferModel {
  const factory OfferModel({
    required String id,
    required String title,
    required String description,
    required double price,
    required DateTime expiryDate,
    required RestaurantModel restaurant, 
    required UserModel user, 
    required int quantity,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);
}
