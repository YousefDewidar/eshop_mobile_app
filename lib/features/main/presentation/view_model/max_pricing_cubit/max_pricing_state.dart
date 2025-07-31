import 'package:rfaye3/features/main/data/models/product_model.dart';

abstract class MaxPriceState {}

class MaxPriceInitial extends MaxPriceState {}

class MaxPriceLoading extends MaxPriceState {}

class MaxPriceSuccess extends MaxPriceState {
  final List<ProductModel> products;

  MaxPriceSuccess({required this.products});
}

class MaxPriceFailure extends MaxPriceState {
  final String message;

  MaxPriceFailure({required this.message});
}
