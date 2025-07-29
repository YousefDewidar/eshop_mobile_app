// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:rfaye3/core/network/api_service.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/checkout/data/models/address.dart';
import 'package:rfaye3/features/checkout/data/models/shipping_type.dart';
import 'package:rfaye3/features/checkout/data/repo/checkout_repo.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  ApiService apiService;
  CheckoutRepoImpl(this.apiService);

  @override
  Future<Either<Failuer, Address>> addNewAddress(Address newAddress) async {
    try {
      final res = await apiService.post(
        "/api/addresses",
        data: newAddress.toMap(),
      );

      return Right(Address.fromJson(res.data));
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, List<Address>>> getAllAddress() async {
    try {
      Response res = await apiService.get("/api/addresses");

      final addresses =
          (res.data as List).map((c) => Address.fromJson(c)).toList();
      return Right(addresses);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, void>> updateAddress() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, void>> removeAddress(String addressId) async {
    try {
      await apiService.delete("/api/addresses/$addressId");

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, String>> createOrder({
    required String addressId,
    required ShippingType shippingType,
  }) async {
    try {
      final res = await apiService.post(
        "/api/orders/checkout",
        data: {
          "shippingAddressId": addressId,
          "paymentMethod": shippingType.name,
        },
      );

      return Right(res.data['unifiedCheckoutUrl']);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }
}
