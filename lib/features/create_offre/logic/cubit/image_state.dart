part of 'image_cubit.dart';

@freezed
class ImageState with _$ImageState {
  const factory ImageState.initial() = Initial;
  const factory ImageState.success(String image_path) = Success;
    const factory ImageState.error(String message) = Error;

}
