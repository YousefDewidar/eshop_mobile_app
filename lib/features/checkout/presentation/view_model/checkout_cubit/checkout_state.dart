
abstract class CheckoutState {}

final class CheckoutInitial extends CheckoutState {}

final class CheckoutSuccess extends CheckoutState {
  final String webViewLink;

  CheckoutSuccess(this.webViewLink);
}

final class CheckoutLoading extends CheckoutState {}

final class CheckoutFail extends CheckoutState {
  final String errMessage;

  CheckoutFail(this.errMessage);
}

final class UsedCouponFail extends CheckoutState {
  final String errMessage;

  UsedCouponFail(this.errMessage);
}

final class UsedCouponLoading extends CheckoutState {}

final class UsedCouponSuccess extends CheckoutState {
  final double discountAmount;

  UsedCouponSuccess(this.discountAmount);
}
