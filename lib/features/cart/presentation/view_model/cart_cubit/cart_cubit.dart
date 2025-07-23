import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/cart/data/models/cart_item_model.dart';
import 'package:rfaye3/features/cart/data/repo/cart_repo.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this.cartRepo) : super(CartInitial());
  final CartRepo cartRepo;

  List<CartItemModel> cartList = [];
  num totalPrice = 0;
  int totalCount = 0;

  void addToCart(CartItemModel product) async {
    emit(CartLoading());
    final result = await cartRepo.addToCart(product);
    result.fold(
      (fail) {
        emit(CartFail(fail.message));
      },
      (success) {
        bool hasProduct = cartList.contains(product);
        if (hasProduct) {
          cartList.firstWhere((e) => e == product).count++;
        } else {
          cartList.add(product);
        }
        calcTotalPrice();
        emit(AddedToCart());
      },
    );
  }

  void removeOneFromCart(CartItemModel product) async {
    bool hasProduct = cartList.contains(product);
    if (hasProduct && product.count > 1) {
      cartList.firstWhere((e) => e == product).count--;
      calcTotalPrice();
      emit(RemovedFromCart());
    }
  }

  void removeItem(CartItemModel product) async {
    emit(CartLoading());
    final result = await cartRepo.removeItem(product.product.id);
    result.fold(
      (fail) {
        emit(CartFail(fail.message));
      },
      (success) {
        cartList.remove(product);
        calcTotalPrice();
        emit(RemovedFromCart());
      },
    );
  }

  void calcTotalPrice() {
    totalPrice = 0;
    totalCount = 0;
    for (var item in cartList) {
      totalPrice += item.calcTotalPriceForItem();
      totalCount += item.count;
    }
  }
}
