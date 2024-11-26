import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/button.dart';
import 'package:eco_bite/core/labeled_textfield.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/create_offre/logic/cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
  String? _selectedImage;
  int _quantity = 1;
  final TextEditingController _price = TextEditingController();
  // Add a variable to track quantity

  @override
  void initState() {
    super.initState();
    _selectedRestaurantId = widget.user?.username; // Assign restaurant ID
  }

  Future<void> addOffer() async {
    // Debugging: Print values to verify
    print('Selected Restaurant ID: $_selectedRestaurantId');
    print('Description: ${_descriptionController.text}');
    print('Meal Name: ${_mealNameController.text}');
    print('Selected Image: $_selectedImage');
    print('Quantity: $_quantity');
    print('price: ${_price.text}');

    if (widget.user?.username == null ||
        _descriptionController.text.trim().isEmpty ||
        _mealNameController.text.trim().isEmpty ||
        _price.toString().isEmpty ||
        _selectedImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required')),
      );
      return;
    }

    try {
      final newOffer = {
        'description': _descriptionController.text.trim(),
        'mealName': _mealNameController.text.trim(),
        'restaurantId': widget.user!.username,
        'imagePath': _selectedImage, // Store the base64 string here
        'quantity': _quantity,
        'price': _price.text.trim(), // Add quantity field
        'createdAt': FieldValue.serverTimestamp(),
      };

      await FirebaseFirestore.instance.collection('offers').add(newOffer);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Offer added successfully')),
      );

      // Clear fields
      _descriptionController.clear();
      _mealNameController.clear();
      _price.clear();
      setState(() {
        _selectedRestaurantId = null;
        _selectedImage = null;
        _quantity = 1;
        // Reset quantity
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
      body: Stack(children: [
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
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 16),
                  LabeledTextField(
                    // textEditingController: context.read<AuthCubit>().addressController,
                    label: 'Restaurant name',
                    hintText: widget.user?.username,
                    readOnly: true,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  LabeledTextField(
                    textEditingController: _descriptionController,
                    label: 'description',
                    hintText: 'add description',
                    maxLines: 2,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  LabeledTextField(
                    textEditingController: _price,
                    label: 'Price',
                    hintText: 'price',
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Quantity:',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (_quantity > 1) _quantity--; // Decrease quantity
                          });
                        },
                        icon: const Icon(Icons.remove, color: Colors.red),
                      ),
                      Text(
                        '$_quantity', // Display current quantity
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _quantity++; // Increase quantity
                          });
                        },
                        icon: const Icon(Icons.add, color: Colors.green),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  LabeledTextField(
                    // textEditingController: context.read<AuthCubit>().addressController,
                    label: 'Address',
                    hintText: widget.user?.address,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  LabeledTextField(
                    // textEditingController: context.read<AuthCubit>().phoneController,
                    label: 'Phone number',
                    hintText: widget.user?.phone,
                    keyboardType: TextInputType.phone,
                    readOnly: true,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  LabeledTextField(
                    hintText: 'meal name',
                    textEditingController: _mealNameController,
                    label: 'Meal name',
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  BlocBuilder<ImageCubit, ImageState>(
                    builder: (context, state) {
                      if (state is Initial) {
                        return RoundedButton(
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                          label: "Pick Image from Gallery",
                          onTap: () async {
                            await context.read<ImageCubit>().pickImage();
                          },
                        );
                      } else if (state is Success) {
                        _selectedImage = state.image_path;

                        return Column(
                          children: [
                            Image.memory(
                              base64Decode(state
                                  .image_path), // Decode the base64 string to display the image
                              height: 200,
                            ),
                            const SizedBox(height: 16),
                            RoundedButton(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                              label: "Add another image",
                              onTap: () {
                                context.read<ImageCubit>().reset();
                              },
                            ),
                          ],
                        );
                      } else if (state is Error) {
                        return Column(
                          children: [
                            Text(state.message),
                            const SizedBox(height: 16),
                            RoundedButton(
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                              label: "Try again",
                              onTap: () {
                                context.read<ImageCubit>().reset();
                              },
                            ),
                          ],
                        );
                      }

                      return Container();
                    },
                  ),
                  const SizedBox(height: 16),
                  RoundedButton(
                    label: 'Add offer',
                    color: AppColor.primary,
                    onTap: () async {
                      await addOffer();
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
