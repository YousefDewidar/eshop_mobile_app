
import 'package:rfaye3/features/checkout/data/models/address.dart';
import 'package:rfaye3/features/checkout/data/models/shipping_type.dart';

class OrderPayload {
  ShippingType? shippingType;
  Address? address;
  num? shipPrice;
  num? orderPrice;

  OrderPayload({
    this.shippingType,
    this.address,
    this.shipPrice,
    this.orderPrice,
  });

  OrderPayload copyWith({
    ShippingType? shippingType,
    Address? address,
    num? shipPrice,
    num? orderPrice,
  }) {
    return OrderPayload(
      shippingType: shippingType ?? this.shippingType,
      address: address ?? this.address,
      shipPrice: shipPrice ?? this.shipPrice,
      orderPrice: orderPrice ?? this.orderPrice,
    );
  }
}