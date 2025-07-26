import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/helper/secure_storage.dart';
import 'package:rfaye3/features/auth/data/models/user_model.dart';
import 'package:rfaye3/features/auth/data/repo/auth_repo.dart';
import 'package:rfaye3/core/network/api_service.dart';
import 'package:rfaye3/core/network/failuer.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;
  AuthRepoImpl(this._apiService);

  @override
  Future<Either<Failuer, UserModel>> getUser() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, void>> resendOtp({required String email}) async {
    try {
      await _apiService.post("/api/auth/resend-otp", data: {"email": email});
      
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, void>> resetPassword({required String email}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, void>> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _apiService.post(
        "/api/auth/login",
        data: {"email": email, "password": password},
      );

      await SecureStorage.saveUserData(
        res.data['accessToken'],
        res.data['refreshToken'],
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, void>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, void>> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, void>> signupWithEmailAndPassword({
    required String email,
    required String password,
    required String fName,
    required String lName,
  }) async {
    try {
      await _apiService.post(
        "/api/auth/register",
        data: {
          "email": email,
          "password": password,
          "firstname": fName,
          "lastname": lName,
        },
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, void>> updatePassword({required String newPassword}) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, void>> verifyEmail({
    required String code,
    required String email,
  }) {
    // TODO: implement verifyEmail
    throw UnimplementedError();
  }
}
