import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/network/api_service.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/cart/data/models/cart_item_model.dart';
import 'package:rfaye3/features/cart/data/repo/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  ApiService apiService;
  CartRepoImpl(this.apiService);

  @override
  Future<Either<Failuer, List<CartItemModel>>> getCartList() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, void>> addToCart(CartItemModel product) async {
    try {
      await apiService.post(
        "/api/cart/items",
        data: {"productId": product.product.id, "quantity": 1},
      );
      return const Right(null);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, void>> removeOneFromCart(CartItemModel product) {
    // TODO: implement removeOneFromCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, void>> removeItem(String productId) async {
    try {
      await apiService.delete("/api/products/$productId");
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }
}
