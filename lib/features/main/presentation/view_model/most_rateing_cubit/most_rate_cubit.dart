import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/most_rateing_cubit/most_rate_state.dart';

class MostRateCubit extends Cubit<MostRateState> {
  MostRateCubit(this.homeRepo) : super(MostRateInitial());
  final HomeRepo homeRepo;

  Future<void> getMostRateProducts() async {
    emit(MostRateLoading());
    final data = await homeRepo.getAllProducts(
      sortBy: 'rating',
      pageSize: 20,
      sortOrder: 'desc',
    );
    data.fold(
      (failuer) {
        emit(MostRateFailure(message: failuer.message));
      },
      (products) {
        emit(MostRateSuccess(products: products));
      },
    );
  }
}
