import 'package:rfaye3/features/main/data/models/product_model.dart';

abstract class MostSeillingState {}

class MostSeillingInitial extends MostSeillingState {}

class MostSeillingLoading extends MostSeillingState {}

class MostSeillingSuccess extends MostSeillingState {
  final List<ProductModel> products;

  MostSeillingSuccess({required this.products});
}

class MostSeillingFailure extends MostSeillingState {
  final String message;

  MostSeillingFailure({required this.message});
}
