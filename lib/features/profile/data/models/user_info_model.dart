// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rfaye3/features/checkout/data/models/address.dart';

class UserInfoModel {
  final String userId;
  final String email;
  final String fullName;
  final List<Address>? addresses;

  UserInfoModel({
    this.addresses,
    required this.userId,
    required this.email,
    required this.fullName,
  });

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      userId: json['userId'],
      email: json['email'],
      fullName: json['fullName'],
    );
  }

  UserInfoModel copyWith({
    String? userId,
    String? email,
    String? fullName,
    List<Address>? addresses,
  }) {
    return UserInfoModel(
      userId: userId ?? this.userId,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      addresses: addresses ?? this.addresses,
    );
  }
}
