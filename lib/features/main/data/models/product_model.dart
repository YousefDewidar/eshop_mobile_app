import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String id;
  final String productCode;
  final String name;
  final String description;
  final String coverPictureUrl;
  final num price;
  final num stock;
  final num weight;
  final String color;
  final num discountPercentage;
  final String sellerId;

  const ProductModel({
    required this.id,
    required this.productCode,
    required this.name,
    required this.description,
    required this.coverPictureUrl,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.discountPercentage,
    required this.sellerId,
  });

  @override
  List<Object?> get props => [
    id,
    productCode,
    name,
    description,
    coverPictureUrl,
    price,
    stock,
    weight,
    color,
    discountPercentage,
    sellerId,
  ];

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      productCode: map['productCode'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      coverPictureUrl: map['coverPictureUrl'] as String,
      price: map['price'] as num,
      stock: map['stock'] as num,
      weight: map['weight'] as num,
      color: map['color'] as String,
      discountPercentage: map['discountPercentage'] as num,
      sellerId: map['sellerId'] as String,
    );
  }


}
