import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/cart/data/models/cart_product_model.dart';

abstract class CartRepo {
  Future<Either<Failuer, List<CartProductModel>>> getCartList();
  Future<Either<Failuer, void>> addToCart(String productId);
  Future<Either<Failuer, void>> removeOneFromCart(String itemIdInCart);
  Future<Either<Failuer, void>> removeItem(String productId);
}
