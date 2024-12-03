import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/create_offre/data/offer_model.dart';
import 'package:eco_bite/features/home/data/restaurant.dart';

class AddOfferRepo {
  Future<OfferModel> fetchOffer(String offerId) async {
    final offerDoc = await FirebaseFirestore.instance
        .collection('offers')
        .doc(offerId)
        .get();
    final offerData = offerDoc.data();

    final restaurantDoc = await FirebaseFirestore.instance
        .collection('restaurans')
        .doc(offerData!['restaurantId'])
        .get();
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(offerData['userId'])
        .get();

    return OfferModel(
        id: offerData['id'],
        title: offerData['title'],
        description: offerData['description'],
        price: offerData['price'],
        expiryDate: DateTime.parse(offerData['expiryDate']),
        restaurant: RestaurantModel.fromJson(restaurantDoc.data()!),
        user: UserModel.fromJson(userDoc.data()!),
        quantity: offerData['quantity'],
        imagePath: offerData['imagePath']);
        
  }
}
