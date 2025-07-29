import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/checkout/data/models/order_payload_model.dart';
import 'package:rfaye3/features/checkout/data/models/shipping_type.dart';
import 'package:rfaye3/features/checkout/data/repo/checkout_repo.dart';
import 'package:rfaye3/features/checkout/presentation/view_model/checkout_cubit/checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this._checkoutRepo) : super(CheckoutInitial());
  final CheckoutRepo _checkoutRepo;

  OrderPayload order = OrderPayload(
    shippingType: ShippingType.Paymob,
    shipPrice: 0,
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
    );

    res.fold(
      (fail) {
        emit(CheckoutFail(fail.message));
      },
      (webViewLink) {
        // if (order.shippingType == ShippingType.Paymob) {
        //   await PaymobService().payWithPaymob(
        //     csk,
        //     buttonBackgroundColor: AppColors.primaryColor,
        //     buttonTextColor: Colors.white,
        //     saveCardDefault: true,
        //     showSaveCard: true,
        //   );
        // }
        emit(CheckoutSuccess(webViewLink));
      },
    );
  }
}
