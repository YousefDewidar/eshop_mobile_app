import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/network/failuer.dart';

abstract class AuthRepo {
  Future<Either<Failuer, void>> signupWithEmailAndPassword({
    required String email,
    required String password,
    required String fName,
    required String lName,
  });

  Future<Either<Failuer, void>> login({
    required String email,
    required String password,
  });

  Future<Either<Failuer, void>> verifyEmail({
    required String code,
    required String email,
  });

  // Step 1 forgot pass
  Future<Either<Failuer, void>> forgetPassword({required String email});

  // Step 2 forgot pass
  Future<Either<Failuer, void>> validateOtp({
    required String email,
    required String code,
  });

  // Step 3 forgot pass
  Future<Either<Failuer, void>> resetPassword({
    required String newPassword,
    required String code,
    required String email,
  });

  Future<Either<Failuer, void>> resendOtp({required String email});

  Future<Either<Failuer, void>> signInWithGoogle();
}
