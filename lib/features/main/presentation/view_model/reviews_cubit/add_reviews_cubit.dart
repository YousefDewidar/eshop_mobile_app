import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/reviews_cubit/add_reviews_state.dart';

class AddReviewsCubit extends Cubit<AddReviewsState> {
  final HomeRepo _homeRepo;
  AddReviewsCubit(this._homeRepo) : super(AddReviewsInitial());

  Future<void> addReview({
    required String id,
    required String comment,
    required int rate,
  }) async {
    emit(AddReviewsLoading());
    final res = await _homeRepo.addReviewForProduct(
      id: id,
      comment: comment,
      rate: rate,
    );
    res.fold(
      (l) {
        emit(AddReviewsFailuer(l.message));
      },
      (r) {
        emit(AddReviewSuccess());
      },
    );
  }
}
