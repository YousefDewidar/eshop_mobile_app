import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/max_pricing_cubit/max_pricing_state.dart';

class MaxPriceCubit extends Cubit<MaxPriceState> {
  MaxPriceCubit(this.homeRepo) : super(MaxPriceInitial());
  final HomeRepo homeRepo;

  Future<void> getMaxPriceProducts({int pageNum = 1}) async {
    if (pageNum == 1) {
      emit(MaxPriceLoading());
    }
    final data = await homeRepo.getAllProducts(
      sortBy: 'price',
      sortOrder: 'desc',
      pageNum: pageNum,
    );
    data.fold(
      (failuer) {
        emit(MaxPriceFailure(message: failuer.message));
      },
      (products) {
        emit(MaxPriceSuccess(products: products));
      },
    );
  }
}
