// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:supabase_flutter/supabase_flutter.dart';

class UserEntity {
  final String email;
  final String name;
  final String uId;

  const UserEntity({
    required this.uId,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uId': uId,
      'email': email,
      'name': name,
    };
  }

  factory UserEntity.fromSupabaseUser(User user) {
    return UserEntity(
      uId: user.id,
      email: user.email!,
      name: user.userMetadata!['name'],
    );
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      uId: map['uId'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) =>
      UserEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
