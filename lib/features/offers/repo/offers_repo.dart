import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_bite/features/create_offre/data/offer_model.dart';

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
          address: data['address'] ?? '',
          phoneNumber: data['phoneNumber'] ?? '',
          category: data['category'] ?? '');
    }).toList());
  }
Future<List<OfferModel>> fetchOffersCategory({required String category}) async {
  final query = _firestore.collection('offers');
  QuerySnapshot querySnapshot;
  
  if (category == "All") {
    querySnapshot = await query.get(); // Fetch all offers
  } else {
    querySnapshot = await query
        .where('category', isEqualTo: category)
        .get(); // Fetch offers by category
  }

  // Map documents to OfferModel instances
  return querySnapshot.docs.map((doc) {
    final data = doc.data() as Map<String, dynamic>? ?? {};

    // Helper function to convert Firestore Timestamp to DateTime
    DateTime? convertTimestamp(dynamic timestamp) {
      if (timestamp is Timestamp) {
        return timestamp.toDate();
      }
      return null;
    }

    print('Fetched data: ${doc.data()}');

    // Return a properly constructed OfferModel
    return OfferModel(
      id: doc.id,
      description: data['description'] ?? '',
      title: data['title'] ?? '',
      imagePath: data['imagePath'] ?? '',
      quantity: data['quantity'] ?? 0,
      price: (data['price'] as num?)?.toDouble() ?? 0.0,
      expiryDate: convertTimestamp(data['expiryDate']),
      createdAt: convertTimestamp(data['createdAt']),
      address: data['address'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      category: data['category'] ?? '',
    );
  }).toList();
}
}