// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rfaye3/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rfaye3/features/auth/domain/entities/user_entity.dart';
import 'package:rfaye3/features/auth/domain/repositories/auth_repository.dart';

class AuthRepoImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  AuthRepoImpl({required this.remoteDataSource});

  @override
  Future<String> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) {
    return remoteDataSource.signUp(firstName, lastName, email, password);
  }

  @override
  Future<UserEntity> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
}
