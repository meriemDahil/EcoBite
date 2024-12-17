import 'dart:convert';

import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/enum_message_type.dart';
import 'package:eco_bite/core/flash_utils.dart';
import 'package:eco_bite/core/notif_service.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/create_offre/data/offer_model.dart';
import 'package:flash/flash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PanierScreen extends StatefulWidget {
  const PanierScreen({
    Key? key,
  }) : super(key: key);

  @override
  _PanierScreenState createState() => _PanierScreenState();
}

class _PanierScreenState extends State<PanierScreen> {
  final PanierCacheService _panierCacheService = PanierCacheService();
  List<OfferModel> panier = [];

  @override
  void initState() {
    super.initState();
    _loadPanierFromCache(); // Load the panier when the screen is initialized
  }

  Future<void> _loadPanierFromCache() async {
    panier = await _panierCacheService.loadPanier();
    setState(() {});
  }

  Future<void> _removeItemFromPanier(int index) async {
    panier.removeAt(index); // Remove the item at the given index
    await _panierCacheService
        .savePanier(panier); // Save updated panier to cache
    setState(() {}); // Trigger UI update
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: panier.isEmpty
          ? Center(child: Text('Panier is empty.'))
          : ListView.builder(
              shrinkWrap: true,
              itemCount: panier.length,
              itemBuilder: (context, index) {
                final offer = panier[index];

                return Card(
                  color: Colors.white,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: offer.imagePath.isNotEmpty
                              ? Image.memory(
                                  base64Decode(offer.imagePath),
                                  width: 120,
                                  height: 120,
                                  fit: BoxFit.cover,
                                )
                              : Icon(
                                  Icons.fastfood,
                                  size: 100,
                                  color: Colors.grey,
                                ),
                        ),
                        const SizedBox(width: 10),
                        // Text content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                offer.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                offer.description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 48, 48, 48),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Quantity: ${offer.quantity}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    ' ${offer.price} Da',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.primary,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                  alignment: Alignment.bottomRight,
                                  icon: Icon(Icons.delete, color: Colors.black),
                                  onPressed: () async {
                                    _removeItemFromPanier(index);
                                    await PointsManager().removePoints(context);
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      backgroundColor: Colors.white,
    );
  }
}

class PanierCacheService {
  static const String _panierKey = 'panier_list_key';

  // Save panier list to cache
  Future<void> savePanier(List<OfferModel> panier) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final panierJson = jsonEncode(panier.map((e) => e.toJson()).toList());
      await prefs.setString(_panierKey, panierJson);
    } catch (e) {
      print("Error saving panier: $e");
    }
  }

  // Load panier list from cache
  Future<List<OfferModel>> loadPanier() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final panierJson = prefs.getString(_panierKey);
      if (panierJson == null || panierJson.isEmpty) {
        return [];
      }
      List<dynamic> decodedList = jsonDecode(panierJson);
      return decodedList.map((e) => OfferModel.fromJson(e)).toList();
    } catch (e) {
      print("Error loading panier: $e");
      return [];
    }
  }

  // Clear the panier list from cache
  Future<void> clearPanier() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_panierKey);
    } catch (e) {
      print("Error clearing panier: $e");
    }
  }
}

class PointsManager {
  static const String _pointsKey = 'user_points_key';

  // Method to add points when an offer is added to the panier
  Future<void> addPoints(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      int points = prefs.getInt(_pointsKey) ?? 0;
      points += 5; // Adding 5 points

      // Save the updated points to cache
      await prefs.setInt(_pointsKey, points);

      // Show success flash message
      FlashUtils.showCustomFlash(
        context: context,
        message: '5 points added to you!',
        type: MessageType
            .success, // Ensure this is defined or replace with another valid MessageType
        backgroundColor:
            AppColor.secondary, // Make sure AppColor.secondary is defined
        position: FlashPosition.top,
      );

      if (points > 25) {
        // Replace 'offerid' with actual offer ID
        await PushNotificationService.sendNotificationToSelectedDriver(
            'cpcl1j1aRTKwtnb7zK5Eml:APA91bHTpivi31dv_R6n--aB4e9o9Lcj7YNnd6BxWLiS63sImUArgmC3I5dKE--Q_i6I13bed7-kkNlM3wTHR6WB2z2nZrwuIAyTz5RcMDfit4wF6wColBo',
            context,
            'actual_offer_id', 
            'Congratulations',
            'Congratulations! You have reached 5 orders and are eligible for a 15% discount.');
      }
    } catch (e) {
      print("Error adding points: $e");
    }
  }

  // Method to remove points when an offer is removed from the panier
  Future<void> removePoints(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      int points = prefs.getInt(_pointsKey) ?? 0;
      points -= 5; // Subtracting 5 points

      // Ensure points don't go below zero
      points = points < 0 ? 0 : points;

      // Save the updated points to cache
      await prefs.setInt(_pointsKey, points);

      // Show success flash message
      FlashUtils.showCustomFlash(
        context: context,
        message: 'You lost 5 points.',
        type: MessageType.warning,
        //backgroundColor: AppColor.,
        position: FlashPosition.top,
      );
    } catch (e) {
      print("Error removing points: $e");
    }
  }

  // Method to get the current points
  Future<int> getPoints() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(_pointsKey) ?? 0;
    } catch (e) {
      print("Error getting points: $e");
      return 0;
    }
  }
}
