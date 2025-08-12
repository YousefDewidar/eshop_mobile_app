import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/cart/data/models/cart_product_model.dart';
import 'package:rfaye3/features/cart/data/repo/cart_repo.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;

  List<CartProductModel> cartList = [];

  num totalPrice = 0;
  int totalCount = 0;

  Future<void> getAllCartList() async {
    emit(CartLoading());
    final result = await cartRepo.getCartList();
    result.fold(
      (fail) {
        emit(CartFail(fail.message));
      },
      (success) {
        cartList = success;
        calcTotalPrice();
        emit(CartLoaded(success));
      },
    );
  }

  Future<void> addToCart(String productId) async {
    emit(AddToCartLoading(productId));
    final result = await cartRepo.addToCart(productId);
    result.fold(
      (fail) {
    
        emit(CartFail(fail.message));
      },
      (success) {
        getAllCartList();
        calcTotalPrice();
      },
    );
  }

  Future<void> removeOneFromCart(String itemIdInCart) async {
    final result = await cartRepo.removeOneFromCart(itemIdInCart);
    result.fold(
      (fail) {
        emit(CartFail(fail.message));
      },
      (success) {
        getAllCartList();
        calcTotalPrice();
      },
    );
  }

  Future<void> removeItem(String itemIdInCart) async {
    final result = await cartRepo.removeItem(itemIdInCart);
    result.fold(
      (fail) {
        emit(CartFail(fail.message));
      },
      (success) {
        getAllCartList();
        calcTotalPrice();
      },
    );
  }

  void calcTotalPrice() {
    totalPrice = 0;
    totalCount = 0;
    for (var item in cartList) {
      totalPrice += item.totalPriceForItem;
      totalCount += item.quantity;
    }
  }
}
