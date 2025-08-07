class CouponModel {
  final String couponCode;
  final String couponType;
  final DateTime expirationDate;
  final int usageTimes;
  final int timesPerUser;
  final int discountValue;
  final int maxDiscount;

  const CouponModel({
    required this.couponCode,
    required this.couponType,
    required this.expirationDate,
    required this.usageTimes,
    required this.timesPerUser,
    required this.discountValue,
    required this.maxDiscount,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        couponCode: json["couponCode"],
        couponType: json["couponType"],
        expirationDate: DateTime.parse(json["expirationDate"]),
        usageTimes: json["usageTimes"],
        timesPerUser: json["timesPerUser"],
        discountValue: json["discountValue"],
        maxDiscount: json["maxDiscount"],
      );

  Map<String, dynamic> toJson() => {
        "couponCode": couponCode,
        "couponType": couponType,
        "expirationDate": expirationDate.toIso8601String(),
        "usageTimes": usageTimes,
        "timesPerUser": timesPerUser,
        "discountValue": discountValue,
        "maxDiscount": maxDiscount,
      };
}
