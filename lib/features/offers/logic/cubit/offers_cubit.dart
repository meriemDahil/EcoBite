import 'package:bloc/bloc.dart';
import 'package:eco_bite/features/create_offre/data/offer_model.dart';
import 'package:eco_bite/features/offers/repo/offers_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offers_state.dart';
part 'offers_cubit.freezed.dart';

class OffersCubit extends Cubit<OffersState> {
  final OffersRepository offerRepo;
  OffersCubit(this.offerRepo) : super(OffersState.initial());
  Future<List<OfferModel>?> fetchAvailabaleOffersCategory(String category) async {
    try {
      emit(OffersState.loading());
      print("Loading offers...");
      final offers = await offerRepo.fetchOffersCategory(category: category);
      print('Fetched data: ${offers}');

      emit(OffersState.success(offers));
      print("Offers loaded successfully.");
      return offers;
    } catch (e) {
      emit(OffersState.error("Error: $e"));
      print("Error fetching offers: $e");
      return null;
    }
  }
  Future<void> fetchAvailabaleOffers() async {
    try {
      emit(OffersState.loading());
      print("Loading offers...");
      final offers = await offerRepo.fetchOffers();
      print('Fetched data: ${offers}');

      emit(OffersState.success(offers));
      print("Offers loaded successfully.");
    } catch (e) {
      emit(OffersState.error("Error: $e"));
      print("Error fetching offers: $e");
     
    }
  }
}
