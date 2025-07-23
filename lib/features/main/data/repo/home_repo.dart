import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/main/data/models/category_entity.dart';
import 'package:rfaye3/features/main/data/models/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failuer, List<ProductEntity>>> getMostSellingProducts();
  Future<Either<Failuer, List<CategoryEntity>>> getAllCategories();

  Future<Either<Failuer, List<ProductEntity>>> searchProducts({
    required String query,
  });
}
