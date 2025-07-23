import 'package:rfaye3/features/main/data/models/product_entity.dart';

sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final String message;

  SearchFailure({required this.message});
}

final class SearchSuccess extends SearchState {
  final List<ProductEntity> products;

  SearchSuccess({required this.products});
}
