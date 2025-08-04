import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rfaye3/features/main/data/models/offer_model.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit(this._homeRepo) : super(OffersInitial());
  final HomeRepo _homeRepo;

  Future<void> getAllOffers() async {
    emit(OffersLoading());
    final data = await _homeRepo.getAllOffers();
    data.fold(
      (failuer) {
        emit(OffersFailure(message: failuer.message));
      },
      (offers) {
        emit(OffersSuccess(offers: offers));
      },
    );
  }
}
