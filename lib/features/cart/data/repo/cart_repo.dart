import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/cart/data/models/cart_item_model.dart';

abstract class CartRepo {
  Future<Either<Failuer, List<CartItemModel>>> getCartList();
  Future<Either<Failuer, void>> addToCart(CartItemModel product);
  Future<Either<Failuer, void>> removeOneFromCart(CartItemModel product);
  Future<Either<Failuer, void>> removeItem(String productId);
}
