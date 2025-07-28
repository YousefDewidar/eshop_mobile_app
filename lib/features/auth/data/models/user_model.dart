// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String? email;
  final String? name;
  final String? image;

  const UserModel({required this.email, required this.name, this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'email': email, 'name': name, 'image': image};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String?,
      name: map['name'] as String?,
      image: map['picture'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
