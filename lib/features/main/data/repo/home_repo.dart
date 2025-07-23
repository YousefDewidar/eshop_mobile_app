import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/main/data/models/category_model.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failuer, List<ProductModel>>> getMostSellingProducts();
  Future<Either<Failuer, List<CategoryModel>>> getAllCategories();

  Future<Either<Failuer, List<ProductModel>>> searchProducts({
    required String query,
  });
}
