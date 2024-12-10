import 'package:cloud_firestore/cloud_firestore.dart';

class OfferRepository {
  Future<void> addOffer({
    required String restaurantId,
    required String description,
    required String mealName,
    required String? imagePath,
    required int quantity,
    required String? address,
    required String? phoneNumber,
    required double price,
    required String category
  }) async {
    try {
      final newOffer = {
        'description': description.trim(),
        'title': mealName.trim(),
        'restaurantId': restaurantId,
        'imagePath': imagePath,
        'quantity': quantity,
        'address': address,
        'phoneNumber': phoneNumber,
        'price': price,
        'createdAt': FieldValue.serverTimestamp(),
        'category':category
      };

      await FirebaseFirestore.instance.collection('offers').add(newOffer);
    } catch (e) {
      throw Exception('Error adding offer: $e');
    }
  }
}
