import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rfaye3/core/helper/secure_storage.dart';
import 'package:rfaye3/features/auth/data/repo/auth_repo.dart';
import 'package:rfaye3/core/network/api_service.dart';
import 'package:rfaye3/core/network/failuer.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;
  AuthRepoImpl(this._apiService);

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
  Future<Either<Failuer, void>> verifyEmail({
    required String code,
    required String email,
  }) async {
    try {
      await _apiService.post(
        "/api/auth/verify-email",
        data: {"email": email, "otp": code},
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
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
  Future<Either<Failuer, void>> signInWithGoogle() async {
    try {
      const webClientId =
          '685240802030-pbvfc9ner95oqgmnmeajk3gihmf2qbqt.apps.googleusercontent.com';

      final GoogleSignIn googleSignIn = GoogleSignIn(
        serverClientId: webClientId,
      );
      googleSignIn.signOut();

      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final idToken = googleAuth.idToken;

      final res = await _apiService.post(
        "/api/auth/google/mobile",
        data: {"idToken": idToken},
      );

      log(res.data.toString());

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
  Future<Either<Failuer, void>> forgetPassword({required String email}) async {
    try {
      await _apiService.post(
        "/api/auth/forgot-password",
        data: {"email": email},
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, void>> validateOtp({
    required String email,
    required String code,
  }) async {
    try {
      await _apiService.post(
        "/api/auth/validate-otp",
        data: {"email": email, "otp": code},
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }

  @override
  Future<Either<Failuer, void>> resetPassword({
    required String newPassword,
    required String code,
    required String email,
  }) async {
    try {
      await _apiService.post(
        "/api/auth/reset-password",
        data: {"email": email, "otp": code, "newPassword": newPassword},
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure.fromError(e));
    }
  }
}
