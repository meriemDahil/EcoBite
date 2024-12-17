import 'dart:convert';

import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/button.dart';
import 'package:eco_bite/core/labeled_textfield.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart'
    as auth;
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:eco_bite/features/create_offre/logic/cubit/add_offer_cubit.dart';
import 'package:eco_bite/features/create_offre/logic/cubit/image_cubit.dart'
    as img;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOffer extends StatefulWidget {
  final UserModel? user;
  AddOffer({Key? key, required this.user}) : super(key: key);

  @override
  State<AddOffer> createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  final List<String> categories = ['Bakery', 'Gluten-free', 'Spicy', 'Other'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is Success) {
                  Navigator.pushReplacementNamed(context, '/signin');
                } else if (state is Error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              child: GestureDetector(
                  child: Icon(
                    Icons.logout,
                    size: 30,
                    color: AppColor.primary,
                  ),
                  onTap: () async {
                    context.read<AuthCubit>().signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                      (route) => false,
                    );
                  }),
            ),
          )
        ],
        centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.user!.username),
                Icon(Icons.arrow_drop_down_outlined)
              ],
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 8),
          child: Image.asset("assets/logo.png"),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 251, 251),
      body: Container(
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.symmetric(
                vertical: BorderSide(color: Colors.black, width: 2))),
        child: Stack(children: [
          BlocConsumer<AddOfferCubit, AddOfferState>(
            listener: (context, state) {
              if (state is AddOfferLoading) {
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Adding offer ...'),
                  backgroundColor: Colors.black,
                ));
              } else if (state is AddOfferSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Offer Added Successefuly!'),
                  backgroundColor: Colors.green,
                ));
                // Clear fields after success
                context.read<AddOfferCubit>().descriptionController.clear();
                context.read<AddOfferCubit>().mealNameController.clear();
                context.read<AddOfferCubit>().priceController.clear();
              } else if (state is AddOfferFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error: ${state.message}')),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                          label: 'Restaurant name',
                          hintText: widget.user?.username,
                          readOnly: true,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 40),
                        LabeledTextField(
                          hintText: 'meal name',
                          textEditingController:
                              context.read<AddOfferCubit>().mealNameController,
                          label: 'Meal name',
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 40),
                        LabeledTextField(
                          textEditingController: context
                              .read<AddOfferCubit>()
                              .descriptionController,
                          label: 'description',
                          hintText: 'add description',
                          maxLines: 2,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 40),
                        LabeledTextField(
                          textEditingController:
                              context.read<AddOfferCubit>().priceController,
                          label: 'Price',
                          hintText: 'price',
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Quantity:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.primary,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (context.read<AddOfferCubit>().quantity >
                                        1)
                                      context.read<AddOfferCubit>().quantity--;
                                  });
                                },
                                icon: const Icon(Icons.remove,
                                    color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${context.read<AddOfferCubit>().quantity}',
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.primary,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    context
                                        .read<AddOfferCubit>()
                                        .quantity++; // Increase quantity
                                  });
                                },
                                icon:
                                    const Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        LabeledTextField(
                          label: 'Address',
                          hintText: widget.user?.address,
                          textEditingController:
                              context.read<AddOfferCubit>().addressController,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 40),
                        LabeledTextField(
                          label: 'Phone number',
                          hintText: widget.user?.phone,
                          keyboardType: TextInputType.phone,
                          textEditingController: context
                              .read<AddOfferCubit>()
                              .phoneNumberController,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 40),
                        const Text(
                          'Category',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          spacing: -4.0, // Space between items
                          runSpacing: 2.0, // Space between rows
                          children: categories.map((category) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<String>(
                                  activeColor: AppColor.secondary,
                                  value: category,
                                  groupValue: context
                                      .read<AddOfferCubit>()
                                      .selectedCategory,
                                  onChanged: (value) {
                                    if (value != null) {
                                      setState(() {
                                        context
                                            .read<AddOfferCubit>()
                                            .setSelectedCategory(value);
                                      });
                                    }
                                  },
                                ),
                                Text(category),
                              ],
                            );
                          }).toList(),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 80),
                        BlocBuilder<img.ImageCubit, img.ImageState>(
                          builder: (context, state) {
                            if (state is img.Initial) {
                              return RoundedButton(
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                label: "Pick Image from Gallery",
                                onTap: () async {
                                  await context
                                      .read<img.ImageCubit>()
                                      .pickImage();
                                },
                              );
                            } else if (state is img.Success) {
                              context.read<AddOfferCubit>().selectedImage =
                                  state.image_path;

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
                                      context.read<img.ImageCubit>().reset();
                                    },
                                  ),
                                ],
                              );
                            } else if (state is img.Error) {
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
                                      context.read<img.ImageCubit>().reset();
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
                            await context.read<AddOfferCubit>().addOffer(context);
                          },
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ]),
      ),
    );
  }
}
