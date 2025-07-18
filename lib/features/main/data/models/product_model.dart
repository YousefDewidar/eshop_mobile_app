import 'package:rfaye3/features/main/data/models/addition_info_model.dart';
import 'package:rfaye3/features/main/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  final int id;
  final String titlee;
  final String descc;
  final num pricee;
  final num? discountt;
  final num rateCountt;
  final num avaRatee;
  final String imgg;
  final AdditionInfoModel additionInfoo;
  final bool isFeatured;
  final num soldTimes;

  const ProductModel({
    required this.id,
    required this.titlee,
    required this.descc,
    required this.pricee,
    this.discountt,
    this.rateCountt = 0,
    this.avaRatee = 0.0,
    required this.imgg,
    required this.additionInfoo,
    this.isFeatured = false,
    this.soldTimes = 0,
  }) : super(
          title: titlee,
          desc: descc,
          price: pricee,
          img: imgg,
          additionInfo: additionInfoo,
          avaRate: avaRatee,
          discount: discountt,
          rateCount: rateCountt,
        );

  // Map<String, dynamic> toMap() {
  //   return {
  //     'title': title,
  //     'desc': desc,
  //     'price': price,
  //     'discount': discount,
  //     'rate_count': rateCount,
  //     'ava_rate': avaRate,
  //     'img': img,
  //     'addition_info': additionInfo,
  //     'is_featured': isFeatured,
  //     'sold_times': soldTimes,
  //   };
  // }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'],
      titlee: map['title'],
      descc: map['desc'],
      pricee: map['price'],
      discountt: map['discount'] as num?,
      rateCountt: map['rate_count'],
      avaRatee: map['ava_rate'],
      imgg: map['img'],
      additionInfoo: AdditionInfoModel.fromJson(map['addition_info']),
      isFeatured: map['is_featured'],
      soldTimes: map['sold_times'],
    );
  }
}
