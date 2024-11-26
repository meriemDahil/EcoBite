import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'image_state.dart';
part 'image_cubit.freezed.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageState.initial());

  final ImagePicker imagePicker =ImagePicker();
  Future<void> pickImage() async{

    try{
      final pickImage = await imagePicker.pickImage(source: ImageSource.gallery);
      if(pickImage!=null){
        emit(ImageState.success(pickImage.path));

      }
      else{
        emit(ImageState.error("No image selected"));
      }

    }catch(e){
      print(e.toString());
      emit(ImageState.error(e.toString()));
    }
  }

  void reset(){
    emit(ImageState.initial());
  }
}
