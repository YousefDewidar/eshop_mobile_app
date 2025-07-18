import 'package:rfaye3/features/main/domain/entities/product_entity.dart';

abstract class MostSeillingState {}

class MostSeillingInitial extends MostSeillingState {}

class MostSeillingLoading extends MostSeillingState {}

class MostSeillingSuccess extends MostSeillingState {
  final List<ProductEntity> products;

  MostSeillingSuccess({required this.products});
}

class MostSeillingFailure extends MostSeillingState {
  final String message;

  MostSeillingFailure({required this.message});
}
