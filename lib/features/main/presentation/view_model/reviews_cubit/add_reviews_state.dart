abstract class AddReviewsState {}

final class AddReviewsInitial extends AddReviewsState {}

final class AddReviewsLoading extends AddReviewsState {}

final class AddReviewsFailuer extends AddReviewsState {
  final String errMessage;

  AddReviewsFailuer(this.errMessage);
}

final class AddReviewSuccess extends AddReviewsState {}
