import 'package:rfaye3/features/cart/data/models/cart_item_entity.dart';
import 'package:rfaye3/features/cart/data/repo/cart_repo.dart';

class CartRepoImpl  implements CartRepo{
  @override
  Future<void> addToCart(CartItemEntity product) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<List<CartItemEntity>> getCartList() {
    // TODO: implement getCartList
    throw UnimplementedError();
  }

  @override
  Future<void> removeItem(CartItemEntity product) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<void> removeOneFromCart(CartItemEntity product) {
    // TODO: implement removeOneFromCart
    throw UnimplementedError();
  }
}