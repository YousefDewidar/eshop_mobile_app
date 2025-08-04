part of 'offers_cubit.dart';

sealed class OffersState extends Equatable {
  const OffersState();

  @override
  List<Object> get props => [];
}

final class OffersInitial extends OffersState {}

final class OffersSuccess extends OffersState {
  final List<OfferModel> offers;
  const OffersSuccess({required this.offers});
}

final class OffersFailure extends OffersState {
  final String message;
  const OffersFailure({required this.message});
}

final class OffersLoading extends OffersState {}
