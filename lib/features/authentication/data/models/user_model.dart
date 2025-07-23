import 'package:rfaye3/features/authentication/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel extends UserEntity {
  UserModel({required super.uId, required super.email, required super.name});

  factory UserModel.fromSupabaseUser(User user) {
    return UserModel(
      uId: user.id,
      email: user.email ?? '',
      name: user.userMetadata?['name'] ?? '',
    );
  }
}
