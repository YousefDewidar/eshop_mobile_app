import 'package:rfaye3/features/main/data/models/product_model.dart';

abstract class GoldProductsState {}

class GoldProductsInitial extends GoldProductsState {}

class GoldProductsLoading extends GoldProductsState {}

class GoldProductsSuccess extends GoldProductsState {
  final List<ProductModel> products;

  GoldProductsSuccess({required this.products});
}

class GoldProductsFailure extends GoldProductsState {
  final String message;

  GoldProductsFailure({required this.message});
}
