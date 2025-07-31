import 'package:rfaye3/features/main/data/models/product_model.dart';

abstract class MinPriceState {}

class MinPriceInitial extends MinPriceState {}

class MinPriceLoading extends MinPriceState {}

class MinPriceSuccess extends MinPriceState {
  final List<ProductModel> products;

  MinPriceSuccess({required this.products});
}

class MinPriceFailure extends MinPriceState {
  final String message;

  MinPriceFailure({required this.message});
}
