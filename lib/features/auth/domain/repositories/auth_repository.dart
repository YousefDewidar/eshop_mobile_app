import 'package:rfaye3/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<String> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  );

  Future<UserEntity> login(String email, String password);
}
