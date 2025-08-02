import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/reviews_cubit/reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  final HomeRepo _homeRepo;
  ReviewsCubit(this._homeRepo) : super(ReviewsInitial());

  Future<void> getProductReviewsById({
    required String id,
    required int pageNum,
  }) async {
    if (pageNum == 1) {
      emit(ReviewsLoading());
    }

    final res = await _homeRepo.getProductReviewsById(id: id, pageNum: pageNum);
    res.fold(
      (fail) {
        emit(ReviewsFailuer(fail.message));
      },
      (reviews) {
        emit(ReviewsSuccess(reviews));
      },
    );
  }
}
