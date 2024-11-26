

import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/features/home/data/restaurant.dart';
import 'package:eco_bite/features/home/repo/restaurant_repo.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSlide extends StatelessWidget {
  final List<RestaurantModel>? res;  
  CarouselSlide({super.key, this.res});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RestaurantModel>>(
      future: RestaurantRepository().getAllRestaurants(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final restaurants = snapshot.data!;
          if (restaurants.isEmpty) {
            return Center(child: Text('No restaurants found.'));
          }

          // Use restaurants data in the carousel
          return CarouselSlider(
            options: CarouselOptions(
              aspectRatio:16/9,
             // enlargeCenterPage: true,
              viewportFraction: 0.92,
              pageSnapping: true,
              autoPlay: false,
              enableInfiniteScroll: false,
            ),
            items: restaurants.map((restaurant) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                   
                    decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15),
                       color: Colors.white,
                       boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(255, 191, 190, 190).withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                    ),
                    margin: const EdgeInsets.all(4),
                    width: MediaQuery.of(context).size.width,
                    height: 320,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                        Stack(
                          children: [
                            // Restaurant image
                            ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                              child: restaurant.image != null &&
                                      restaurant.image!.isNotEmpty
                                  ? Image.network(
                                      restaurant.image!,
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
                            // Rating badge
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow, size: 17),
                                    const SizedBox(width: 4),
                                    Text(
                                      restaurant.rating.toString(),
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Restaurant name below the image
                       // const SizedBox(height: 8),
                        Text(
                          restaurant.restaurantName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                         Row(
                           children: [
                            Icon(Icons.delivery_dining,color: AppColor.primary,),
                             Text(
                              "Livraison gratuite",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                                overflow: TextOverflow.ellipsis,
                              ),
                                                     ),
                           ],
                         ),

                      ],
                    ),
                  );
                },
              );
            }).toList(),
          );
        } else {
          return Center(child: Text('No data available.'));
        }
      },
    );
  }
}
