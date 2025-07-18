
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/main/domain/repo/home_repo.dart';
import 'package:rfaye3/features/main/presentation/manager/products_cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.homeRepo) : super(ProductsInitial());


  final HomeRepo homeRepo;

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    final data = await homeRepo.getAllProducts();
    data.fold(
      (failuer) {
        emit(ProductsFailure(message: failuer.message));
      },
      (products) {
        emit(ProductsSuccess(products: products));
      },
    );
  }
}
