import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';

import 'package:eco_bite/features/create_offre/data/offer_model.dart';
import 'package:eco_bite/features/home/data/restaurant.dart';

class OffersRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<OfferModel>> fetchOffers() async {
    final querySnapshot = await _firestore.collection('offers').get();

    return Future.wait(querySnapshot.docs.map((doc) async {
      final data = doc.data();
      DateTime? convertTimestamp(dynamic timestamp) {
        if (timestamp is Timestamp) {
          return timestamp.toDate();
        }
        return null;
      }
      print('Fetched data: ${doc.data()}');

      return OfferModel(
        id: doc.id,
        description: data['description'] ?? '',
        title: data['title'] ?? '',
        imagePath: data['imagePath'] ?? '',
        quantity: data['quantity'] ?? 0,
        price: (data['price'] as num?)?.toDouble() ?? 0.0,
        expiryDate: convertTimestamp(data['expiryDate']),
        createdAt: convertTimestamp(data['createdAt']),
        
      );
    }).toList());
  }
}
