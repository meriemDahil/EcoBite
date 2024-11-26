import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

part 'image_state.dart';
part 'image_cubit.freezed.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageState.initial());

  final ImagePicker _imagePicker = ImagePicker();

  // Method to pick, compress, and convert the image to base64
  Future<void> pickImage() async {
    try {
      final pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Get the image file
        File imageFile = File(pickedFile.path);

        // Read the image as bytes
        List<int> imageBytes = await imageFile.readAsBytes();

        // Decode the image to an img.Image
        img.Image? image = img.decodeImage(Uint8List.fromList(imageBytes));

        if (image != null) {
          // Compress the image (you can specify width/height for resizing)
          img.Image compressedImage = img.copyResize(image, width: 600); // Resize to 600px width

          // Encode the compressed image to bytes
          List<int> compressedImageBytes = img.encodeJpg(compressedImage, quality: 80); // Compress with 80% quality

          // Convert the compressed image bytes to base64
          String base64Image = base64Encode(compressedImageBytes);

          // Emit the base64 string
          emit(ImageState.success(base64Image));
        } else {
          emit(ImageState.error("Failed to decode image"));
        }
      } else {
        emit(ImageState.error("No image selected"));
      }
    } catch (e) {
      print("Error picking image: $e");
      emit(ImageState.error(e.toString()));
    }
  }

  // Reset the state to its initial value
  void reset() {
    emit(ImageState.initial());
  }
}
