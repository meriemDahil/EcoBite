import 'dart:convert';

import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/features/create_offre/data/offer_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PanierScreen extends StatefulWidget {
  const PanierScreen({Key? key}) : super(key: key);

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
                                onPressed: () => _removeItemFromPanier(index),
                              ),
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
    final prefs = await SharedPreferences.getInstance();
    final panierJson = jsonEncode(panier.map((e) => e.toJson()).toList());
    prefs.setString(_panierKey, panierJson);
  }

  // Load panier list from cache
  Future<List<OfferModel>> loadPanier() async {
    final prefs = await SharedPreferences.getInstance();
    final panierJson = prefs.getString(_panierKey);
    if (panierJson == null) {
      return [];
    }
    List<dynamic> decodedList = jsonDecode(panierJson);
    return decodedList.map((e) => OfferModel.fromJson(e)).toList();
  }

  // Clear the panier list from cache
  Future<void> clearPanier() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_panierKey);
  }
}
