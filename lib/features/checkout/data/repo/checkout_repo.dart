import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/network/failuer.dart';
import 'package:rfaye3/features/checkout/data/models/address.dart';

abstract class CheckoutRepo {
  Future<Either<Failuer, List<Address>>> getAllAddress();
  Future<Either<Failuer, void>> updateAddress();
  Future<Either<Failuer, Address>> addNewAddress(Address newAddress);
  Future<Either<Failuer, void>> removeAddress(String addressId);
}
