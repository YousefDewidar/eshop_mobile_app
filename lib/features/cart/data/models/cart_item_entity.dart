// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:rfaye3/features/main/data/models/product_entity.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity product;
  int count;

  CartItemEntity({required this.product, this.count = 1});

  int calcWeight() {
    return count * 1;
  }

  num calcTotalPriceForItem() {
    return (count * product.price);
  }

  @override
  List<Object?> get props => [product];
}
