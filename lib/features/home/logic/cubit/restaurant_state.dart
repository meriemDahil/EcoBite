
part of 'restaurant_cubit.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState.initial() = _Initial;
  const factory RestaurantState.loading() = Loading;
  const factory RestaurantState.success(List<RestaurantModel> restaurants) = Success;
  const factory RestaurantState.error(String message) = Error;
}
