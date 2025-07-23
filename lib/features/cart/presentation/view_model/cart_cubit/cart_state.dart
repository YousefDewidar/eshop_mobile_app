sealed class CartState {}

final class CartInitial extends CartState {}

final class AddedToCart extends CartState {}

final class RemovedFromCart extends CartState {}

final class CartLoading extends CartState {}

final class CartFail extends CartState {
  final String error;
  CartFail(this.error);
}
