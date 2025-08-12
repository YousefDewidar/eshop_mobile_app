// class CouponModel {
//   final String id;
//   final String couponCode;
//   final String couponType;
//   final DateTime expiresAt;
//   final int usagesLeft;
//   final int timesUsed;
//   final int timesPerUser;
//   final double discountValue;
//   final double maxDiscount;

//   const CouponModel({
//     required this.id,
//     required this.couponCode,
//     required this.couponType,
//     required this.expiresAt,
//     required this.usagesLeft,
//     required this.timesUsed,
//     required this.timesPerUser,
//     required this.discountValue,
//     required this.maxDiscount,
//   });

//   factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
//     id: json["id"],
//     couponCode: json["couponCode"],
//     couponType: json["couponType"],
//     expiresAt: DateTime.parse(json["expiresAt"]),
//     usagesLeft: json["usagesLeft"],
//     timesUsed: json["timesUsed"],
//     timesPerUser: json["timesPerUser"],
//     discountValue: json["discountValue"].toDouble(),
//     maxDiscount: json["maxDiscount"].toDouble(),
//   );

//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "couponCode": couponCode,
//     "couponType": couponType,
//     "expiresAt": expiresAt.toIso8601String(),
//     "usagesLeft": usagesLeft,
//     "timesUsed": timesUsed,
//     "timesPerUser": timesPerUser,
//     "discountValue": discountValue,
//     "maxDiscount": maxDiscount,
//   };
// }
