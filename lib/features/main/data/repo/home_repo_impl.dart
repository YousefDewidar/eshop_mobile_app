import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/errors/custom_exception.dart';
import 'package:rfaye3/core/supabase/database_services.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/domain/entities/product_entity.dart';
import 'package:rfaye3/features/main/domain/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final DatabaseServices database;

  HomeRepoImpl(this.database);

  @override
  Future<Either<Failuer, List<ProductEntity>>> getMostSellingProducts() async {
    try {
      final dataMap = await database.getOrderdRecordsWithLimit(
        tableName: 'products',
        orderBy: 'sold_times',
        limit: 6,
      );
      List<ProductEntity> products =
          dataMap.map((item) => ProductModel.fromMap(item)).toList();

      return right(products);
    } catch (e) {
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuer, List<ProductEntity>>> getAllProducts() async {
    try {
      final dataMap = await database.getAllRecords(tableName: 'products');

      List<ProductEntity> products =
          dataMap.map((item) => ProductModel.fromMap(item)).toList();
      return right(products);
    } catch (e) {
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuer, List<ProductEntity>>> searchProducts({
    required String query,
  }) async {
    try {
      final dataList = await database.search(
        tableName: "products",
        columnName: "title",
        q: query,
      );

      List<ProductEntity> products =
          dataList.map((item) => ProductModel.fromMap(item)).toList();

      return right(products);
    } catch (e) {
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }
}
