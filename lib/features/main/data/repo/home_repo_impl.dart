import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rfaye3/core/network/api_service.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/main/data/models/category_model.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failuer, List<ProductModel>>> getMostSellingProducts() async {
    try {
      Response data = await apiService.get("/api/products");

      final products =
          (data.data as List).map((e) {
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
      List<ProductModel> products = [];
      return right(products);
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }
}
