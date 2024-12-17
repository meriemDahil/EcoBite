import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/features/home/data/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RestaurantDetails extends StatefulWidget {
  final RestaurantModel restaurantDetails;
  const RestaurantDetails({super.key, required this.restaurantDetails});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  bool isStarred = false;
  late double rating;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rating = widget.restaurantDetails.rating!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(children: [
            Positioned(
              child: Container(
                height: 340,
                width: double.maxFinite,
                decoration: const BoxDecoration(),
                child: widget.restaurantDetails.image != null &&
                        widget.restaurantDetails.image!.isNotEmpty
                    ? Image.memory(
                        base64Decode(widget.restaurantDetails.image!),
                        width: double.infinity,
                        height: 150,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.grey[300],
                        child: Center(
                          child: Icon(Icons.image_not_supported,
                              size: 50, color: Colors.grey[600]),
                        ),
                      ),
              ),
            ),
            Positioned(
              top: 330,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                child: Stack(children: [
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
                        padding:
                            const EdgeInsets.only(left: 13, top: 30, right: 13),
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.restaurantDetails.restaurantName,
                                      style: const TextStyle(
                                        fontFamily: 'DM_Serif_Text',
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 255, 66, 14),
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.7,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () async {
                                        setState(() {
                                          isStarred = !isStarred;
                                          if (isStarred) {
                                            rating = rating + 0.1;
                                          } else {
                                            rating = rating - 0.1;
                                          }
                                          widget.restaurantDetails.rating = rating;
                                        });
                                        print(FirebaseFirestore.instance
                                            .collection('restaurants')
                                            .doc(widget.restaurantDetails.id));

                                        try {
                                          await FirebaseFirestore.instance
                                              .collection('restaurans')
                                              .doc(widget.restaurantDetails.id)
                                              .update({'rating': rating});
                                        } catch (e) {
                                          print(
                                              'Error updating rating in Firestore: $e');
                                        }
                                      },
                                      icon: Icon(
                                        isStarred
                                            ? Icons.star
                                            : Icons
                                                .star_border, // Filled or outlined star
                                        size: 28,
                                        color: isStarred
                                            ? Colors.yellow
                                            : Colors.grey, // Change color
                                      ),
                                    ),
                                    Text(
                                      "Rating: ${rating}",
                                      style: TextStyle(fontSize: 18),
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
                                                  'https://www.google.com/maps/search/?api=1&query=${widget.restaurantDetails.address}';
                                              Uri uri = Uri.parse(url);
                                              await launchUrl(uri);
                                            },
                                            child: widget.restaurantDetails
                                                            .address !=
                                                        null &&
                                                    widget.restaurantDetails
                                                        .address!.isNotEmpty
                                                ? Text(
                                                    widget.restaurantDetails
                                                        .address!,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 0.7,
                                                    ),
                                                  )
                                                : Text(
                                                    "Address Retaurant! is null",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 0.7,
                                                    ),
                                                  )),
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
                                                widget.restaurantDetails.phone!;
                                            Uri uri =
                                                Uri(scheme: 'tel', path: url);
                                            await launchUrl(uri);
                                            print('phone call');
                                          },
                                          child: Text(
                                            widget.restaurantDetails.phone!,
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
                                SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height / 40),
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
                                  widget.restaurantDetails.description,
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 47, 47, 47),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.7,
                                  ),
                                  // maxLines: 5,
                                ),
                                SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height / 50),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Open Time!",
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.7,
                                      ),
                                    ),
                                    Text(
                                      "Close Time!",
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.7,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.restaurantDetails.openingTime!,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.7,
                                        ),
                                      ),
                                      Text(
                                        widget.restaurantDetails.closingTime!,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 0.7,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height / 20),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        ));
  }
}
