import 'package:rfaye3/features/main/domain/entities/product_entity.dart';

class AdditionInfoModel extends AdditionInfoEntity {
  final String? dateExpiredd;
  final String? calaryy;
  const AdditionInfoModel({
    this.dateExpiredd,
    this.calaryy,
  }) : super(
          dateExpired: dateExpiredd,
          calary: calaryy,
        );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'dateExpired': dateExpiredd,
      'calary': calary,
    };
  }

  factory AdditionInfoModel.fromJson(Map<String, dynamic> map) {
    return AdditionInfoModel(
      dateExpiredd: map['date_expired'] as String?,
      calaryy: map['calary'] as String?,
    );
  }
}
