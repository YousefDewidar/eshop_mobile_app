import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/main/data/models/category_model.dart';
import 'package:rfaye3/features/main/data/models/notification_model.dart';
import 'package:rfaye3/features/main/data/models/offer_model.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/data/models/review_model.dart';

abstract class HomeRepo {
  Future<Either<Failuer, List<CategoryModel>>> getAllCategories();

  Future<Either<Failuer, List<ProductModel>>> getAllProducts({
    num minPrice,
    num maxPrice,
    String sortBy,
    String sortOrder,
    String category,
    int pageNum,
  });
  Future<Either<Failuer, List<String>>> getAllProductImages({
    required String pId,
  });

  Future<Either<Failuer, List<ProductModel>>> searchProducts({
    required String query,
    required String catName,
    required num minPrice,
    required num maxPrice,
    required String sortOrder,
  });

  Future<Either<Failuer, List<ReviewModel>>> getProductReviewsById({
    required String id,
    required int pageNum,
  });

  Future<Either<Failuer, void>> addReviewForProduct({
    required String id,
    required String comment,
    required int rate,
  });

  Future<Either<Failuer, List<OfferModel>>> getAllOffers();

  Future<Either<Failuer, List<NotificationModel>>> getAllNotifications();

  Future<Either<Failuer, void>> markAsReadNotification({
    required String notiId,
  });
  Future<Either<Failuer, void>> markAllAsReadNotification({
    required List<String> notiIds,
  });
}
