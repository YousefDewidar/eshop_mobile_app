// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:rfaye3/features/main/data/models/product_model.dart';

// ignore: must_be_immutable
class CartItemModel extends Equatable {
  final ProductModel product;
  int count;

  CartItemModel({required this.product, this.count = 1});

  num calcWeight() {
    return count * product.weight;
  }

  num calcTotalPriceForItem() {
    return (count * product.price);
  }

  @override
  List<Object?> get props => [product];
}
