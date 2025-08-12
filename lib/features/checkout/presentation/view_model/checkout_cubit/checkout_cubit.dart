import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/checkout/data/models/order_payload_model.dart';
import 'package:rfaye3/features/checkout/data/models/shipping_type.dart';
import 'package:rfaye3/features/checkout/data/repo/checkout_repo.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/checkout_cubit/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this._checkoutRepo) : super(CheckoutInitial());
  final CheckoutRepo _checkoutRepo;
  double? discount;
  String? couponCode;

  OrderPayload order = OrderPayload(
    shippingType: ShippingType.Paymob,
    shipPrice: 50,
  );

  void setOrderPrice(num orderPrice) {
    order.orderPrice = orderPrice;
  }

  Future<void> createOrder() async {
    emit(CheckoutLoading());

    if (order.address == null || order.shippingType == null) return;
    final res = await _checkoutRepo.createOrder(
      addressId: order.address!.id,
      shippingType: order.shippingType!,
      couponCode: couponCode,
    );

    res.fold(
      (fail) {
        emit(CheckoutFail(fail.message));
      },
      (webViewLink) {
        emit(CheckoutSuccess(webViewLink));
      },
    );
  }

  Future<void> useCoupon({required String couponCode}) async {
    emit(UsedCouponLoading());
    final res = await _checkoutRepo.useCoupon(couponCode: couponCode);

    res.fold(
      (fail) {
        emit(UsedCouponFail(fail.message));
      },
      (coupon) {
        discount = coupon;
        this.couponCode = couponCode;
        emit(UsedCouponSuccess(coupon));
      },
    );
  }
}
