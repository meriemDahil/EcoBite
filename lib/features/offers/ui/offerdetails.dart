import 'dart:convert';
import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/button.dart';
import 'package:eco_bite/features/comment/logic/cubit/comment_cubit.dart';
import 'package:eco_bite/features/create_offre/data/offer_model.dart';
import 'package:eco_bite/features/panier/ui/panier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class Offerdetails extends StatefulWidget {
  final OfferModel offerdetails;

  const Offerdetails({
    required this.offerdetails,
    super.key,
  });

  @override
  State<Offerdetails> createState() => _OfferdetailsState();
}

class _OfferdetailsState extends State<Offerdetails> {
  late int quantity;
  late double price;
  final PanierCacheService _panierCacheService = PanierCacheService();
  List<OfferModel> panier = [];

  @override
  void initState() {
    super.initState();
    context.read<CommentCubit>().fetchComments();
    quantity = 1;
    price = widget.offerdetails.price;
    _loadPanierFromCache();
  }

  Future<void> _loadPanierFromCache() async {
    panier = await _panierCacheService.loadPanier();
    setState(() {});
  }

  // Add to panier
  Future<void> _addToPanier(OfferModel offer) async {
    setState(() {
      panier.add(offer);
    });
    await _panierCacheService
        .savePanier(panier); // Save updated panier to cache
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${offer.title} added to Panier'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final random = Random();
    // final randomValue =
    //     (random.nextDouble() * 0.5) + 0.1; // Generate value between 0.1 and 0.6
    // final rating = (4.2 + randomValue).toStringAsFixed(1);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                  height: 340,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(),
                  child: Image.memory(
                    base64Decode(widget.offerdetails.imagePath),
                    fit: BoxFit.cover,
                  )),
            ),
            Positioned(
              top: 330,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 13, top: 30, right: 13),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MEAL:  ',
                                      style: const TextStyle(
                                        fontFamily: 'DM_Serif_Text',
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.7,
                                      ),
                                    ),
                                    Text(
                                      widget.offerdetails.title,
                                      style: const TextStyle(
                                        fontFamily: 'DM_Serif_Text',
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 255, 66, 14),
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.7,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Category:  ',
                                      style: const TextStyle(
                                        fontFamily: 'DM_Serif_Text',
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.7,
                                      ),
                                    ),
                                    Text(
                                      widget.offerdetails.category,
                                      style: const TextStyle(
                                        fontFamily: 'DM_Serif_Text',
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 255, 187, 0),
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.7,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(Icons.location_pin,
                                            color: Color.fromARGB(
                                                255, 12, 116, 16)),
                                        const SizedBox(width: 10.0),
                                        GestureDetector(
                                          onTap: () async {
                                            String url =
                                                'https://www.google.com/maps/search/?api=1&query=${widget.offerdetails.address}';
                                            Uri uri = Uri.parse(url);
                                            await launchUrl(uri);
                                          },
                                          child: Text(
                                            widget.offerdetails.address,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.7,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(Icons.call,
                                            color: Color.fromARGB(
                                                255, 12, 116, 16)),
                                        const SizedBox(width: 10.0),
                                        GestureDetector(
                                          onTap: () async {
                                            String url =
                                                widget.offerdetails.phoneNumber;
                                            Uri uri =
                                                Uri(scheme: 'tel', path: url);
                                            await launchUrl(uri);
                                            print('phone call');
                                          },
                                          child: Text(
                                            widget.offerdetails.phoneNumber,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: 0.7,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        price.toString(),
                                        style: const TextStyle(
                                          fontFamily: 'DM_Serif_Text',
                                          fontSize: 24,
                                          color:
                                              Color.fromARGB(255, 255, 66, 14),
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.7,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const SizedBox(width: 16),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppColor.primary,
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  // Ensure quantity does not go below 1
                                                  if (quantity > 1) {
                                                    price -= widget
                                                        .offerdetails.price;
                                                    quantity--;
                                                  }
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              quantity
                                                  .toString(), // Display the updated quantity
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            ),
                                          ),
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppColor.primary,
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (quantity <
                                                      widget.offerdetails
                                                          .quantity) {
                                                    // Increment quantity without adding offerdetails' quantity repeatedly
                                                    quantity++;
                                                    price += widget
                                                        .offerdetails.price;
                                                  }
                                                });
                                              },
                                              icon: const Icon(Icons.add,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ]),
                                const SizedBox(height: 8.0),
                                Text(
                                  'Description:',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.7,
                                  ),
                                ),
                                Text(
                                  widget.offerdetails.description,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.7,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height / 20),
                                RoundedButton(
                                    icon: Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    label: 'Add To Panier',
                                    color: AppColor.primary,
                                    onTap: () {
                                      _addToPanier(widget.offerdetails);
                                      
                                    })
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
