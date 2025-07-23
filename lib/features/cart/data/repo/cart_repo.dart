import 'package:rfaye3/features/cart/data/models/cart_item_entity.dart';

abstract class CartRepo {
  Future<List<CartItemEntity>> getCartList();
  Future<void> addToCart(CartItemEntity product);
  Future<void> removeOneFromCart(CartItemEntity product);
  Future<void> removeItem(CartItemEntity product);
}