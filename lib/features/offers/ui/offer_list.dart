import 'dart:convert';

import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/features/create_offre/data/offer_model.dart';
import 'package:eco_bite/features/offers/logic/cubit/offers_cubit.dart';
import 'package:eco_bite/features/offers/ui/offerdetails.dart';
import 'package:eco_bite/features/splashScreen/loading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class OfferList extends StatefulWidget {
  final List<OfferModel> offers;
  OfferList({super.key, required this.offers});

  @override
  State<OfferList> createState() => _OfferListState();
}

class _OfferListState extends State<OfferList> {
  final List<String> chips = ["All", "Bakery", "Gluten-free", "Spicy"];
  late List<bool> isSelectedList;
  late List<OfferModel> filteredOffers;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isSelectedList = List.generate(chips.length, (index) => false);
    filteredOffers = widget.offers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Ecobite'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 8),
            child: Image.asset("assets/logo.png"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: chips.asMap().entries.map((entry) {
                  int index = entry.key;
                  String chip = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: FilterChip(
                      label: Text(chip),
                      onSelected: (value) async {
                        final category = chips[index];

                        setState(() {
                          isLoading = true;
                          // Deselect all chips
                          isSelectedList =
                              List.generate(chips.length, (i) => i == index);
                        });

                        // Fetch the offers
                        final offers = await context
                            .read<OffersCubit>()
                            .fetchAvailabaleOffersCategory(category);

                        setState(() {
                          isLoading = false;
                          filteredOffers = offers!;
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
              isLoading
                  ? Center(child: LoadingIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: filteredOffers.length,
                      itemBuilder: (context, index) {
                        final offer = filteredOffers[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Offerdetails(
                                      offerdetails: offer,
                                    )));
                          },
                          child: Card(
                            color: Colors.white,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 5),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Image
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: offer.imagePath.isNotEmpty
                                        ? Image.memory(
                                            base64Decode(offer.imagePath),
                                            width: 120,
                                            height: 120,
                                            fit: BoxFit.cover,
                                          )
                                        : Icon(
                                            Icons.fastfood,
                                            size: 100,
                                            color: Colors.grey,
                                          ),
                                  ),
                                  const SizedBox(width: 10),
                                  // Text content
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          offer.title,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          offer.description,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 48, 48, 48),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Quantity: ${offer.quantity}',
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Text(
                                              ' ${offer.price} Da',
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.primary,
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
                          ),
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
