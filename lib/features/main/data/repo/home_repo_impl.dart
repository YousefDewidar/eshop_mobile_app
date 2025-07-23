import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rfaye3/core/network/api_service.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/main/data/models/category_entity.dart';
import 'package:rfaye3/features/main/data/models/product_entity.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failuer, List<ProductEntity>>> getMostSellingProducts() async {
    try {
      Response data = await apiService.get("/api/products");

      final products =
          (data.data as List).map((e) {
            return ProductEntity.fromJson(e);
          }).toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, List<CategoryEntity>>> getAllCategories() async {
    try {
      try {
        Response data = await apiService.get("/api/categories");
        log(data.data.toString());

        List<CategoryEntity> products =
            (data.data as List).map((e) {
              return CategoryEntity.fromJson(e);
            }).toList();

        return right(products);
      } catch (e) {
        log(e.toString());
        return left(ServerFailure.fromError(e));
      }
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, List<ProductEntity>>> searchProducts({
    required String query,
  }) async {
    try {
      List<ProductEntity> products = [];
      return right(products);
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }
}
