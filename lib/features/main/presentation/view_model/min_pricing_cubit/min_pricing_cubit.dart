import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/min_pricing_cubit/min_pricing_state.dart';

class MinPriceCubit extends Cubit<MinPriceState> {
  MinPriceCubit(this.homeRepo) : super(MinPriceInitial());
  final HomeRepo homeRepo;

  Future<void> getMinPriceProducts() async {
    emit(MinPriceLoading());
    final data = await homeRepo.getAllProducts(
      sortBy: 'price',
      sortOrder: 'asc',
      pageSize: 13,
      minPrice: 0,
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
