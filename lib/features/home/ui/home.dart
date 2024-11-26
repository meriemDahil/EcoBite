import 'dart:convert';

import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/search.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:eco_bite/features/create_offre/repo/add_offer_repo.dart';
import 'package:eco_bite/features/home/data/restaurant.dart';
import 'package:eco_bite/features/home/repo/restaurant_repo.dart';
import 'package:eco_bite/features/home/ui/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  final UserModel? user;
  Home({super.key, required this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> chips = ["All", "Bakery", "fast food"];
  late List<bool> isSelectedList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelectedList = List.generate(chips.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/profile.jpg"),
                    radius: 30,
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
            Text(
              "cité 1200 El biar, Alger",
              style: TextStyle(fontSize: 14, color: AppColor.primary),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 8),
          child: Image.asset("assets/logo.png"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'les produits disponibles\naujourd’hui ?',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              const SearchWidget(hintText: 'Chercher des produits...'),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: chips.asMap().entries.map((entry) {
                  int index = entry.key;
                  String chip = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: FilterChip(
                      label: Text(chip),
                      onSelected: (value) {
                        setState(() {
                          isSelectedList[index] = value;
                        });
                      },
                      selected: isSelectedList[index],
                      backgroundColor: Colors.white,
                      selectedColor: AppColor.primary,
                      showCheckmark: false,
                      elevation: 5,
                      pressElevation: 5,
                      labelStyle: isSelectedList[index]
                          ? const TextStyle(color: Colors.white)
                          : const TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                  child: const Row(
                children: [
                  Text(
                    "Découvrir nos partenaires",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColor.primary),
                  ),
                  Icon(Icons.arrow_right_alt, color: AppColor.primary)
                ],
              )),
              CarouselSlide(),
              Text(
                'Découvrir nos offres pour aujourd’hui ->',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primary),
              ),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: AddOfferRepo().fetchOffers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No offers available.'));
                  }

                  final offers = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: offers.length,
                    itemBuilder: (BuildContext context, int index) {
                      final offer = offers[index];

                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 5),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Larger image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: offer['imagePath'] != null
                                    ? Image.memory(
                                        base64Decode(offer['imagePath']),
                                        width: 100, // Adjust size
                                        height: 100, // Adjust size
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(Icons.fastfood,
                                        size: 100,
                                        color: Colors.grey), // Placeholder
                              ),
                              const SizedBox(width: 10),
                              // Text content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      offer['mealName'] ?? 'No meal name',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      offer['description'] ??
                                          'No description available',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Quantity: ${offer['quantity'] ?? 'N/A'}',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Text(
                                          'Price: ${offer['price'] ?? 'None'} Da',
                                          style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
