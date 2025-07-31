import 'package:rfaye3/features/main/data/models/product_model.dart';

abstract class MostRateState {}

class MostRateInitial extends MostRateState {}

class MostRateLoading extends MostRateState {}

class MostRateSuccess extends MostRateState {
  final List<ProductModel> products;

  MostRateSuccess({required this.products});
}

class MostRateFailure extends MostRateState {
  final String message;

  MostRateFailure({required this.message});
}
