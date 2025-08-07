
sealed class ProductImagesState {}

final class ProductImagesInitial extends ProductImagesState {}

class ProductImagesLoading extends ProductImagesState {}

class ProductImagesSuccess extends ProductImagesState {
  final List<String> images;

  ProductImagesSuccess({required this.images});
}

class ProductImagesFailure extends ProductImagesState {
  final String message;

  ProductImagesFailure({required this.message});
}
