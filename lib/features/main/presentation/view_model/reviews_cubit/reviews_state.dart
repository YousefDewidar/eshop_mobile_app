import 'package:rfaye3/features/main/data/models/review_model.dart';

abstract class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsSuccess extends ReviewsState {
  final List<ReviewModel> reviews;

  ReviewsSuccess(this.reviews);
}

final class ReviewsLoading extends ReviewsState {}

final class ReviewsFailuer extends ReviewsState {
  final String errMessage;

  ReviewsFailuer(this.errMessage);
}
