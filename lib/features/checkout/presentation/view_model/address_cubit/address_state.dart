import 'package:rfaye3/features/checkout/data/models/address.dart';

abstract class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoading extends AddressState {}

final class AddressSuccess extends AddressState {
  final List<Address> addresses;

  AddressSuccess(this.addresses);
}

final class AddAddressSuccess extends AddressState {
  final Address newAddress;

  AddAddressSuccess(this.newAddress);
}

final class RemovedAddressSuccess extends AddressState {}

final class AddressFailuer extends AddressState {
  final String errMessage;

  AddressFailuer(this.errMessage);
}
