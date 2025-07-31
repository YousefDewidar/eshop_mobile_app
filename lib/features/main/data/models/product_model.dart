import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/profile/presentation/view_model/settings_cubit/settings_cubit.dart';

class ProductModel extends Equatable {
  final String id;
  final String productCode;
  final String name;
  final String arabicName;
  final String description;
  final String arabicDescription;
  final String coverPictureUrl;
  final num price;
  final num stock;
  final num weight;
  final String color;
  final num discountPercentage;
  final num rating;
  final int reviewsCount;
  final String sellerId;
  final List<String> categories;

  const ProductModel({
    required this.id,
    required this.productCode,
    required this.name,
    required this.arabicName,
    required this.description,
    required this.arabicDescription,
    required this.coverPictureUrl,
    required this.price,
    required this.stock,
    required this.weight,
    required this.color,
    required this.discountPercentage,
    required this.rating,
    required this.reviewsCount,
    required this.sellerId,
    required this.categories,
  });

  @override
  List<Object?> get props => [
    id,
    productCode,
    name,
    arabicName,
    description,
    arabicDescription,
    coverPictureUrl,
    price,
    stock,
    weight,
    color,
    discountPercentage,
    rating,
    reviewsCount,
    sellerId,
    categories,
  ];

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      productCode: map['productCode'] as String,
      name: map['name'] as String,
      arabicName: map['arabicName'] as String,
      description: map['description'] as String,
      arabicDescription: map['arabicDescription'] as String,
      coverPictureUrl: map['coverPictureUrl'] as String,
      price: map['price'] as num,
      stock: map['stock'] as num,
      weight: map['weight'] as num,
      color: map['color'] as String,
      discountPercentage: map['discountPercentage'] as num,
      rating: map['rating'] as num,
      reviewsCount: map['reviewsCount'] as int,
      sellerId: map['sellerId'] as String,
      categories: List<String>.from(map['categories']),
    );
  }

  String getProductNameByLang(BuildContext context) {
    if (context.watch<SettingsCubit>().langCode == "ar") {
      return arabicName;
    } else {
      return name;
    }
  }

  String getProductDescByLang(BuildContext context) {
    if (context.watch<SettingsCubit>().langCode == "ar") {
      return arabicDescription;
    } else {
      return description;
    }
  }

  static ProductModel getDummyProduct() => const ProductModel(
    id: "0",
    productCode: "dsv",
    name: "ndsion",
    description: "jlbnsjobv idinhsvio",
    coverPictureUrl: "",
    price: 1,
    stock: 1,
    weight: 1,
    color: "",
    discountPercentage: 1,
    sellerId: "",
    arabicName: 'sca',
    arabicDescription: 'as',
    categories: ['ca', 'as'],
    rating: 3.2,
    reviewsCount: 5,
  );
}
