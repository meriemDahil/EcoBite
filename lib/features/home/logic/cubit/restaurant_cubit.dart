import 'package:bloc/bloc.dart';
import 'package:eco_bite/features/home/data/restaurant.dart';
import 'package:eco_bite/features/home/repo/restaurant_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_state.dart';
part 'restaurant_cubit.freezed.dart';
class RestaurantCubit extends Cubit<RestaurantState> {
  final RestaurantRepository restaurantRepository;

  RestaurantCubit(this.restaurantRepository) : super(RestaurantState.initial());

  void fetchRestaurants() async {
    try {
      emit(RestaurantState.loading());
      final restaurants = await restaurantRepository.getAllRestaurants();
      emit(RestaurantState.success(restaurants));
    } catch (e) {
      emit(RestaurantState.error('Failed to fetch restaurants: $e'));
    }
  }
}
