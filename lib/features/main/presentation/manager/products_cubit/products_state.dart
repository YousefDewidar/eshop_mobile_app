
import 'package:rfaye3/features/main/domain/entities/product_entity.dart';

sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}


class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;

  ProductsSuccess({required this.products});
}

class ProductsFailure extends ProductsState {
  final String message;

  ProductsFailure({required this.message});
}
