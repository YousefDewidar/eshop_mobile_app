import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/checkout/data/models/address.dart';
import 'package:rfaye3/features/checkout/data/repo/checkout_repo.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/address_cubit/address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this._checkoutRepo) : super(AddressInitial());
  final CheckoutRepo _checkoutRepo;

  Future<void> getAllAddress() async {
    emit(AddressLoading());
    final res = await _checkoutRepo.getAllAddress();

    res.fold(
      (fail) {
        emit(AddressFailuer(fail.message));
      },
      (success) {
        emit(AddressSuccess(success));
      },
    );
  }

  Future<void> addNewAddress(Address newAddress) async {
    emit(AddressLoading());
    final res = await _checkoutRepo.addNewAddress(newAddress);

    res.fold(
      (fail) {
        emit(AddressFailuer(fail.message));
      },
      (success) {
        emit(AddAddressSuccess(success));
      },
    );
  }

  Future<void> removeAddress(String addressId) async {
    final res = await _checkoutRepo.removeAddress(addressId);

    res.fold(
      (fail) {
        log(fail.message);
        emit(AddressFailuer(fail.message));
      },
      (success) {
        log("message");
      },
    );
  }
}
