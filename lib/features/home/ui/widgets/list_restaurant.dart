import 'dart:convert';

import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:eco_bite/features/home/data/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListRestaurant extends StatefulWidget {
  final UserModel? user;
  final List<RestaurantModel>? res;
  const ListRestaurant({required this.user, required this.res, super.key});

  @override
  State<ListRestaurant> createState() => _ListRestaurantState();
}

class _ListRestaurantState extends State<ListRestaurant> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        ),
        body: ListView.builder(
          itemCount: widget.res!.length,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          itemBuilder: (context, index) {
            final restaurant = widget.res![index];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 191, 190, 190)
                        .withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: restaurant.image != null &&
                                restaurant.image!.isNotEmpty
                            ? Image.memory(
                                base64Decode(restaurant.image!),
                                width: double.infinity,
                                height: 150,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                width: double.infinity,
                                height: 150,
                                color: Colors.grey[300],
                                child: Center(
                                  child: Icon(
                                    Icons.image_not_supported,
                                    size: 50,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ),
                      ),
                      // Rating badge
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 17,
                              ),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.restaurantName,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.delivery_dining,
                              color: AppColor.primary,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "Livraison gratuite",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
