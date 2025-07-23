import 'dart:convert';

import 'package:rfaye3/core/constants/api_constants.dart';
import 'package:rfaye3/core/network/api_service.dart';
import 'package:rfaye3/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  );

  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<String> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    final response = await apiService.post(
      ApiConstants.register,
      data: {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'password': password,
      },
    );

    final data =
        response.data is String ? json.decode(response.data) : response.data;

    if (data.containsKey('errors')) {
      throw Exception(data['errors']['email'][0]);
    } else {
      return data['message'];
    }
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await apiService.post(
      ApiConstants.login,
      data: {'email': email, 'password': password},
    );

    return UserModel.fromJson(response.data);
  }
}
