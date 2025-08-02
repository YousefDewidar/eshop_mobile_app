import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/view_model/gold_products_cubit/gold_products_state.dart';

class GoldProductsCubit extends Cubit<GoldProductsState> {
  GoldProductsCubit(this.homeRepo) : super(GoldProductsInitial());
  final HomeRepo homeRepo;

  Future<void> getGoldProdcuts({int pageNum = 1}) async {
    if (pageNum == 1) {
      emit(GoldProductsLoading());
    }
    final data = await homeRepo.getAllProducts(
      category: "jewellery",
      pageNum: pageNum,
    );
    data.fold(
      (failuer) {
        emit(GoldProductsFailure(message: failuer.message));
      },
      (products) {
        emit(GoldProductsSuccess(products: products));
      },
    );
  }
}
