import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String title;
  final String desc;
  final num price;
  final num? discount;
  final num rateCount;
  final num avaRate;
  final String img;
  final AdditionInfoEntity additionInfo;

  const ProductEntity({
    required this.title,
    required this.desc,
    required this.price,
    this.discount,
    this.rateCount = 0,
    this.avaRate = 0.0,
    required this.img,
    required this.additionInfo,
  });

  @override
  List<Object?> get props => [title, desc, price];
}

class AdditionInfoEntity extends Equatable {
  final String? dateExpired;
  final String? calary;
  const AdditionInfoEntity({
    this.dateExpired,
    this.calary,
  });

  @override
  List<Object?> get props => [dateExpired, calary];
}
