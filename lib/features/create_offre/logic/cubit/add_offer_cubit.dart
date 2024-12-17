import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:eco_bite/core/notif_service.dart';
import 'package:eco_bite/features/create_offre/data/offer_model.dart';
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

  Future<void> addOffer(BuildContext context) async {
    if (_validateInputs()) {
      try {
        emit(AddOfferLoading()); // Start loading

        final double? price = double.tryParse(priceController.text.trim());
        if (price == null) {
          emit(AddOfferFailure("Invalid price format."));
          return;
        }

        // Add the offer using the repository
          addOfferRepository.addOffer(
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
         final String deviceToken = await _getDeviceTokenForNotification();
        if (deviceToken.isNotEmpty) {
          await PushNotificationService.sendNotificationToSelectedDriver(
            'cpcl1j1aRTKwtnb7zK5Eml:APA91bHTpivi31dv_R6n--aB4e9o9Lcj7YNnd6BxWLiS63sImUArgmC3I5dKE--Q_i6I13bed7-kkNlM3wTHR6WB2z2nZrwuIAyTz5RcMDfit4wF6wColBo',
            // 'fhPbwcqLRw2d2fUuVUGRaW:APA91bEPGn14zvzwG9fEJBKfP01pSzf-rf-yl89ddGBHPYekIvYyuhhkoByCS0CaIhkMqEZo6UhAi8X0tqw4Bh_ZpdFJ7mlhIjwcm0NHsflGTh8q6YhmZxo',
            context,
            'offerid',
            mealNameController.text.trim(),
            descriptionController.text.trim()    
          );
        }

       
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
Future<String> _getDeviceTokenForNotification() async {
    // Replace this with your logic to fetch the appropriate device token
    // This is just a simulation
    try {
      // Simulate fetching the device token from a database
      await Future.delayed(Duration(seconds: 1));
      return "sampleDeviceToken123"; // Replace with actual token fetching logic
    } catch (e) {
      print("Error fetching device token: $e");
      return "";
    }
  }


}
