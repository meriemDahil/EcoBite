import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/button.dart';
import 'package:eco_bite/core/labeled_textfield.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/create_offre/logic/cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class AddOffer extends StatefulWidget {
   final UserModel? user;
   AddOffer({Key? key, required this.user}) : super(key: key);

  @override
  State<AddOffer> createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _mealNameController = TextEditingController();
  String? _selectedRestaurantId;
  String? _selectedUserId;
  String? _selectedImage;

  Future<List<Map<String, dynamic>>> fetchRestaurants() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('restaurans').get();
    return querySnapshot.docs
        .map((doc) => {'id': doc.id, 'name': doc['restaurantName']})
        .toList();
  }

Future<void> addOffer() async {
  if (_selectedRestaurantId == null ||
      _descriptionController.text.isEmpty ||
      _mealNameController.text.isEmpty ||
      _selectedImage == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All fields are required')),
    );
    return;
  }

  try {
    final newOffer = {
      'description': _descriptionController.text,
      'mealName': _mealNameController.text,
      'restaurantId': _selectedRestaurantId,
      'imagePath': _selectedImage, // Store the base64 string here
      'createdAt': FieldValue.serverTimestamp(),
    };

    await FirebaseFirestore.instance.collection('offers').add(newOffer);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Offer added successfully')),
    );

    // Clear fields
    _descriptionController.clear();
    _mealNameController.clear();
    setState(() {
      _selectedRestaurantId = null;
      _selectedImage = null;
    });
  } catch (e) {
    print(e.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $e')),
    );
  }
}

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 6,
            left: 0,
            child: SvgPicture.asset(
              'assets/svg/circle.svg',
              width: 40,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: SvgPicture.asset(
              'assets/svg/right_corner.svg',
              width: 100,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/svg/corner.svg',
              width: 100,
            ),
          ),
        //   BlocConsumer<AuthCubit, AuthState>(
        //     listener: (context, state) {
        //       if (state is Error) {
        //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //           content: Text(state.error),
        //           backgroundColor: Colors.red,
        //         ));
        //       }
        //       if (state is Success) {
        //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //           content: Text('Sign up successful! ${state.user?.username}'),
        //           backgroundColor: Colors.green,
        //         ));
        //         Navigator.pushAndRemoveUntil(
        //           context,
        //           MaterialPageRoute(builder: (context) => Home(user: state.user)),
        //           (route) => false,
        //         );
        //       }
        //       if (state is Loading){
        //           showDialog(
        //             context: context,
        //             barrierDismissible: false,
        //             builder: (context) => Center(
        //               child: CircularProgressIndicator(
        //                 color: Colors.deepOrange,
        //               ),
        //             ),
        //           );
        //  }
        //     },   
        //     builder: (context, state) {
        //         return 
         SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add new offer here',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.black),
                ),
                const SizedBox(height: 16),
                FutureBuilder<List<Map<String, dynamic>>>(
                  future: fetchRestaurants(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('No restaurants found');
                    }

                    final restaurants = snapshot.data!;
                    return DropdownButton<String>(
                      value: _selectedRestaurantId,
                      hint: const Text('Select Restaurant'),
                      items: restaurants
                          .map(
                            (restaurant) => DropdownMenuItem<String>(
                              value: restaurant['id'],
                              child: Text(restaurant['name']),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedRestaurantId = value;
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _mealNameController,
                  decoration: const InputDecoration(labelText: 'Meal Name'),
                ),
                const SizedBox(height: 16),
                BlocBuilder<ImageCubit, ImageState>(
  builder: (context, state) {
    if (state is Initial) {
      return ElevatedButton(
        onPressed: () async {
          await context.read<ImageCubit>().pickImage();
        },
        child: const Text('Pick Image from Gallery'),
      );
    } else if (state is Success) {
      // Decode the base64 string and display the image
      _selectedImage = state.image_path;  // Store the base64 string in _selectedImage

      return Column(
        children: [
          Image.memory(
            base64Decode(state.image_path),  // Decode the base64 string to display the image
            height: 200,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<ImageCubit>().reset();
            },
            child: const Text('Add Another Image'),
          ),
        ],
      );
    } else if (state is Error) {
      return Column(
        children: [
          Text(state.message),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<ImageCubit>().reset();
            },
            child: const Text('Try Again'),
          ),
        ],
      );
    }

    return Container();
  },
),

                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: addOffer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Add Offer'),
                ),
              ],
            ),
          ),
        ),
    )]),
    );
  }
}
              
      