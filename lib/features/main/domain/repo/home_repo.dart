import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/errors/custom_exception.dart';
import 'package:rfaye3/features/main/domain/entities/category_entity.dart';
import 'package:rfaye3/features/main/domain/entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failuer, List<ProductEntity>>> getMostSellingProducts();
  Future<Either<Failuer, List<CategoryEntity>>> getAllCategories();

  Future<Either<Failuer, List<ProductEntity>>> searchProducts({
    required String query,
  });
}
