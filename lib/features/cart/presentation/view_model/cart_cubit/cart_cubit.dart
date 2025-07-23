import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/cart/data/models/cart_item_entity.dart';
import 'package:rfaye3/features/cart/presentation/view_model/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartItemEntity> cartList = [];
  num totalPrice = 0;
  int totalCount = 0;

  void addToCart(CartItemEntity product) {
    bool hasProduct = cartList.contains(product);
    if (hasProduct) {
      cartList.firstWhere((e) => e == product).count++;
    } else {
      cartList.add(product);
    }
    calcTotalPrice();
    emit(AddedToCart());
  }

  void removeOneFromCart(CartItemEntity product) {
    bool hasProduct = cartList.contains(product);
    if (hasProduct && product.count > 1) {
      cartList.firstWhere((e) => e == product).count--;
      calcTotalPrice();
      emit(RemovedFromCart());
    }
  }

  void removeItem(CartItemEntity product) {
    cartList.remove(product);
    calcTotalPrice();
    emit(RemovedFromCart());
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
