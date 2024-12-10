import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/search.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:eco_bite/features/home/ui/widgets/carousel.dart';
import 'package:eco_bite/features/home/ui/widgets/offers.dart';
import 'package:eco_bite/features/offers/ui/offer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  final UserModel? user;
  Home({super.key, required this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'les produits disponibles Aujourd’hui ?',
                style: TextStyle(
                    fontSize: 20,
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
              
              const SizedBox(
                height: 5,
              ),
              CarouselSlide(
                user: widget.user,
              ),
              
              Offers(),
            ],
          ),
        ),
      ),
    );
  }
}
