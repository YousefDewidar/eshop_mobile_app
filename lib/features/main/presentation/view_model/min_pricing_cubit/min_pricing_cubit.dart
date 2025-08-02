import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/min_pricing_cubit/min_pricing_state.dart';

class MinPriceCubit extends Cubit<MinPriceState> {
  MinPriceCubit(this.homeRepo) : super(MinPriceInitial());
  final HomeRepo homeRepo;

  Future<void> getMinPriceProducts({int pageNum = 1}) async {
    if (pageNum == 1) {
      emit(MinPriceLoading());
    }

    final data = await homeRepo.getAllProducts(
      sortBy: 'price',
      sortOrder: 'asc',
      minPrice: 0,
      pageNum: pageNum,
    );
    data.fold(
      (failuer) {
        emit(MinPriceFailure(message: failuer.message));
      },
      (products) {
        emit(MinPriceSuccess(products: products));
      },
    );
  }
}
