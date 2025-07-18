sealed class CartState {}

final class CartInitial extends CartState {}

final class AddedToCart extends CartState {}

final class RemovedFromCart extends CartState {}
