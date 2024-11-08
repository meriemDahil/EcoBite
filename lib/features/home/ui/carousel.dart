

import 'package:eco_bite/features/home/data/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class CarouselSlide extends StatelessWidget {
  final List<Restaurant>? res;  
  CarouselSlide({super.key, this.res});

  @override
  Widget build(BuildContext context) {
    final placeholderData = List.generate(
      10,
      (index) => Restaurant(
        name: 'Placeholder ${index + 1}', 
        image: '',  
      ),
    );

    final displayData = res ?? placeholderData;

    return CarouselSlider(
      options: CarouselOptions(
         viewportFraction: 1,  
         pageSnapping: true,  
         //enlargeCenterPage: true,
        // autoPlayInterval: const Duration(seconds: 3),
         autoPlay: false,
         enableInfiniteScroll:false,
       
      ),
      items: displayData.map((restaurant) {
        return Builder(
          
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.primaries[restaurant.name.hashCode % Colors.primaries.length],  
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: restaurant.image.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(restaurant.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[300],  
                            ),
                            child: Center(
                              child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey[600]),
                            ),
                          ),
                  ),
                  // Restaurant name or placeholder
                  Positioned(
                    bottom: 10,
                    left: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        restaurant.name,  // Either placeholder or actual name
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 0, 0, 0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

