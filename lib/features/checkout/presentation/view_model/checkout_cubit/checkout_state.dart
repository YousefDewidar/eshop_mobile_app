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
