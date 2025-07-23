import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/errors/custom_exception.dart';
import 'package:rfaye3/features/main/data/models/category_entity.dart';
import 'package:rfaye3/features/main/data/models/product_entity.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failuer, List<ProductEntity>>> getMostSellingProducts() async {
    try {
      final products = [
        const ProductEntity(
          title: "title",
          desc: "desc",
          price: 40,
          img:
              "https://www.iomm.org.my/wp-content/uploads/2019/11/imm_logo-removebg-preview.png",
          additionInfo: AdditionInfoEntity(),
        ),
        const ProductEntity(
          title: "asc",
          desc: "deascassc",
          price: 20,
          img:
              "https://www.iomm.org.my/wp-content/uploads/2019/11/imm_logo-removebg-preview.png",
          additionInfo: AdditionInfoEntity(),
        ),
        const ProductEntity(
          title: "tiatle",
          desc: "desac",
          price: 30,
          img:
              "https://www.iomm.org.my/wp-content/uploads/2019/11/imm_logo-removebg-preview.png",
          additionInfo: AdditionInfoEntity(),
        ),
      ];

      return right(products);
    } catch (e) {
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuer, List<CategoryEntity>>> getAllCategories() async {
    try {
      return right(dummyCategories);
    } catch (e) {
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuer, List<ProductEntity>>> searchProducts({
    required String query,
  }) async {
    try {
      final products = [
        const ProductEntity(
          title: "title",
          desc: "desc",
          price: 40,
          img:
              "https://www.iomm.org.my/wp-content/uploads/2019/11/imm_logo-removebg-preview.png",
          additionInfo: AdditionInfoEntity(),
        ),
        const ProductEntity(
          title: "asc",
          desc: "deascassc",
          price: 20,
          img:
              "https://www.iomm.org.my/wp-content/uploads/2019/11/imm_logo-removebg-preview.png",
          additionInfo: AdditionInfoEntity(),
        ),
        const ProductEntity(
          title: "tiatle",
          desc: "desac",
          price: 30,
          img:
              "https://www.iomm.org.my/wp-content/uploads/2019/11/imm_logo-removebg-preview.png",
          additionInfo: AdditionInfoEntity(),
        ),
      ];

      return right(products);
    } catch (e) {
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }
}
