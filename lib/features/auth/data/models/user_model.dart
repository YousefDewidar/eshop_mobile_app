import 'package:rfaye3/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String token;

  UserModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'token': token,
    };
  }
}
