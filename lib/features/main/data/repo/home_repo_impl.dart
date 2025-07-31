import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rfaye3/core/network/api_service.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/main/data/models/category_model.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/data/models/review_model.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failuer, List<ProductModel>>> getMostSellingProducts() async {
    try {
      Response data = await apiService.get("/api/products");

      final products =
          (data.data['items'] as List).map((e) {
            return ProductModel.fromJson(e);
          }).toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, List<CategoryModel>>> getAllCategories() async {
    try {
      try {
        Response data = await apiService.get("/api/categories");
        List<CategoryModel> products =
            (data.data as List).map((e) {
              return CategoryModel.fromJson(e);
            }).toList();

        return right(products);
      } catch (e) {
        return left(ServerFailure.fromError(e));
      }
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, List<ProductModel>>> searchProducts({
    required String query,
  }) async {
    try {
      Response data = await apiService.get("/api/products/?searchTerm=$query");

      final products =
          (data.data['items'] as List).map((e) {
            return ProductModel.fromJson(e);
          }).toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, List<ReviewModel>>> getProductReviewsById({
    required String id,
  }) async {
    try {
      Response data = await apiService.get("/api/reviews/$id?pageSize=10");

      final reviews =
          (data.data['reviews']['items'] as List).map((e) {
            return ReviewModel.fromJson(e);
          }).toList();
      return right(reviews);
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, void>> addReviewForProduct({
    required String id,
    required String comment,
    required int rate,
  }) async {
    try {
      await apiService.post(
        "/api/reviews/$id",
        data: {"comment": comment, "rating": rate},
      );

      return right(null);
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }
}
