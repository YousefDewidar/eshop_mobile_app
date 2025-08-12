import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rfaye3/core/network/api_service.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/main/data/models/category_model.dart';
import 'package:rfaye3/features/main/data/models/notification_model.dart';
import 'package:rfaye3/features/main/data/models/offer_model.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';
import 'package:rfaye3/features/main/data/models/review_model.dart';
import 'package:rfaye3/features/main/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failuer, List<ProductModel>>> getAllProducts({
    num minPrice = 0,
    num maxPrice = 1000000,
    String sortBy = '',
    String sortOrder = '',
    String category = '',
    int pageNum = 1,
  }) async {
    try {
      Response data = await apiService.get(
        "/api/products/?MinPrice=$minPrice&MaxPrice=$maxPrice&SortBy=$sortBy&SortOrder=$sortOrder&category=$category&page=$pageNum&pageSize=10",
      );

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
            (data.data['categories'] as List).map((e) {
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
    required String catName,
    required num minPrice,
    required num maxPrice,
    required String sortOrder,
  }) async {
    try {
      Response data = await apiService.get(
        "/api/products/?searchTerm=$query&category=$catName&MinPrice=$minPrice&MaxPrice=$maxPrice&SortBy=price&SortOrder=$sortOrder",
      );

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
    required int pageNum,
  }) async {
    try {
      Response data = await apiService.get(
        "/api/reviews/$id?pageSize=10&page=$pageNum",
      );

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

  @override
  Future<Either<Failuer, List<OfferModel>>> getAllOffers() async {
    try {
      final res = await apiService.get("/api/offers?pageSize=100");

      final List<OfferModel> offers = [];

      for (var offer in res.data['offers']['items']) {
        offers.add(OfferModel.fromJson(offer));
      }

      return right(offers);
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, List<NotificationModel>>> getAllNotifications() async {
    try {
      final res = await apiService.get(
        "/api/notifications?includeRead=true&page=1&pageSize=20",
      );

      final List<NotificationModel> notifications = [];

      for (var noti in res.data['notifications']['items']) {
        notifications.add(NotificationModel.fromJson(noti));
      }

      return right(notifications);
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, void>> markAsReadNotification({
    required String notiId,
  }) async {
    try {
      await apiService.post("/api/notifications/$notiId/read", data: {});

      return right(null);
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, List<String>>> getAllProductImages({
    required String pId,
  }) async {
    try {
      final res = await apiService.get("/api/products/$pId");

      final List<String> productImages = [];

      for (var image in res.data['productPictures']) {
        productImages.add(image);
      }

      return right(productImages);
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, void>> markAllAsReadNotification({
    required List<String> notiIds,
  }) async {
    try {
      await apiService.post(
        "/api/notifications/bulk-read",
        data: {"notificationIds": notiIds},
      );

      return right(null);
    } catch (e) {
      return left(ServerFailure.fromError(e));
    }
  }
}
