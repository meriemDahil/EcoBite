part of 'add_offer_cubit.dart';

@freezed
class AddOfferState with _$AddOfferState {
  const factory AddOfferState.initial() = _Initial;
  const factory AddOfferState.AddOfferLoading() = AddOfferLoading ;
  const factory AddOfferState.AddOfferSuccess() = AddOfferSuccess;
  const factory AddOfferState.AddOfferFailure(String message) = AddOfferFailure;

}
