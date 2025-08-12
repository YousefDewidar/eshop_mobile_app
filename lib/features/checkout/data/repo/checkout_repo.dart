import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/checkout/data/models/address.dart';
import 'package:rfaye3/features/checkout/data/models/shipping_type.dart';

abstract class CheckoutRepo {
  Future<Either<Failuer, List<Address>>> getAllAddress();
  Future<Either<Failuer, void>> updateAddress();
  Future<Either<Failuer, Address>> addNewAddress(Address newAddress);
  Future<Either<Failuer, void>> removeAddress(String addressId);

  Future<Either<Failuer, double>> useCoupon({required String couponCode});

  Future<Either<Failuer, String>> createOrder({
    required String addressId,
    required ShippingType shippingType,
    String? couponCode,
  });
}
