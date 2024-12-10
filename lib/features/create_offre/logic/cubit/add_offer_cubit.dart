import 'package:bloc/bloc.dart';
import 'package:eco_bite/features/create_offre/repo/add_offer_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_offer_state.dart';
part 'add_offer_cubit.freezed.dart';
class AddOfferCubit extends Cubit<AddOfferState> {
  final OfferRepository addOfferRepository;

  AddOfferCubit(this.addOfferRepository) : super(_Initial());

  final descriptionController = TextEditingController();
  final mealNameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final priceController = TextEditingController();

  String? selectedRestaurantId;
  String? selectedImage;
  String selectedCategory = "all"; // Only one category
  int quantity = 1;

  void setSelectedRestaurantId(String? id) {
    selectedRestaurantId = id;
  }

  void setImage(String? image) {
    selectedImage = image;
  }

  void setQuantity(int qty) {
    quantity = qty;
  }

  void setSelectedCategory(String category) {
    selectedCategory = category;
  }

  Future<void> addOffer() async {
    if (_validateInputs()) {
      try {
        emit(AddOfferLoading()); // Start loading

        final double? price = double.tryParse(priceController.text.trim());
        if (price == null) {
          emit(AddOfferFailure("Invalid price format."));
          return;
        }

        await addOfferRepository.addOffer(
          restaurantId: selectedRestaurantId ?? '',
          description: descriptionController.text,
          mealName: mealNameController.text,
          imagePath: selectedImage,
          quantity: quantity,
          address: addressController.text,
          phoneNumber: phoneNumberController.text,
          price: price.toDouble(),
          category: selectedCategory, // Pass the selected category
        );

        emit(AddOfferSuccess()); // Success state
      } catch (e) {
        emit(AddOfferFailure("There is an error: ${e.toString()}"));
      }
    } else {
      emit(AddOfferFailure("Invalid inputs. Please check all fields."));
    }
  }

  bool _validateInputs() {
    return descriptionController.text.trim().isNotEmpty &&
        mealNameController.text.trim().isNotEmpty &&
        priceController.text.trim().isNotEmpty &&
        double.tryParse(priceController.text.trim()) != null &&
        selectedImage != null &&
        selectedCategory != null; // Ensure a category is selected
  }
}
