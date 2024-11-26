import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_bite/features/home/data/restaurant.dart';

class RestaurantRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 Future<RestaurantModel?> getRestaurantByUserId(String userId) async {
  try {
    print('Fetching restaurant for userId: $userId');
    final doc = await _firestore.collection('restaurants').doc(userId).get();
    if (doc.exists) {
      print('Restaurant found: ${doc.data()}');
      return RestaurantModel.fromJson(doc.data()!);
    } else {
      print('No restaurant document found for userId: $userId');
      return null;
    }
  } catch (e) {
    print('Error fetching restaurant: $e');
    rethrow;
  }
}

  Future<List<RestaurantModel>> getAllRestaurants() async {
    try {
      final querySnapshot = await _firestore.collection('restaurans').get();
      return querySnapshot.docs
          .map((doc) => RestaurantModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      print('Error fetching restaurants: $e');
      rethrow;
    }
  }

  Future<void> createRestaurant(RestaurantModel restaurant) async {
    try {
      await _firestore.collection('restaurans').doc(restaurant.id).set(restaurant.toJson());
    } catch (e) {
      rethrow;
    }
  }

  // Add other methods for updating, deleting, etc.
}
