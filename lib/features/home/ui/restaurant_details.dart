import 'package:flutter/material.dart';

class RestaurantDetails extends StatelessWidget {
  const RestaurantDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final offerId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Offer Details')),
      body: Center(
        child: Text('Offer ID: $offerId'),
      ),
    );
  }
}
