import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/network/api_service.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/cart/data/models/cart_product_model.dart';
import 'package:rfaye3/features/cart/data/repo/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  ApiService apiService;
  CartRepoImpl(this.apiService);

  @override
  Future<Either<Failuer, List<CartProductModel>>> getCartList() async {
    try {
      final res = await apiService.get("/api/cart");

      List<CartProductModel> cartList =
          (res.data['cartItems'] as List)
              .map((e) => CartProductModel.fromJson(e))
              .toList();

      return Right(cartList);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, void>> addToCart(String productId) async {
    try {
      await apiService.post(
        "/api/cart/items/",
        data: {"productId": productId, "quantity": 1},
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, void>> removeOneFromCart(String itemIdInCart) async {
    try {
      await apiService.post(
        "/api/cart/items/decrement",
        data: {"itemId": itemIdInCart},
      );
      return const Right(null);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, void>> removeItem(String itemIdInCart) async {
    try {
      //
      await apiService.delete("/api/cart/items/$itemIdInCart");
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }
}
