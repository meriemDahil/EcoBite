import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/search.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:eco_bite/features/home/ui/widgets/carousel.dart';
import 'package:eco_bite/features/home/ui/widgets/offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  final UserModel? user;
  Home({super.key, required this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> chips = ["All", "Bakery", "Gluten-free", "Spicy"];
  late List<bool> isSelectedList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelectedList = List.generate(chips.length, (index) => false);
    //context.read<OffersCubit>().fetchAvailabaleOffers();
  }

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
              CarouselSlide(
                user: widget.user,
              ),
              Text(
                'Découvrir nos offres pour aujourd’hui ->',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColor.primary),
              ),
              Offers(),
            ],
          ),
        ),
      ),
    );
  }
}
