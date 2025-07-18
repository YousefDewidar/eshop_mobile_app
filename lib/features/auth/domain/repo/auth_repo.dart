import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/errors/custom_exception.dart';
import 'package:rfaye3/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failuer, UserEntity>> signupWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<Failuer, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failuer, void>> signOut();

  Future<Either<Failuer, void>> verifyEmail(
      {required String code, required String email});

  Future<Either<Failuer, void>> resetPassword({required String email});

  Future<Either<Failuer, void>> updatePassword({required String newPassword});

  Future<Either<Failuer, void>> resendOtp({required String email});

  Future<Either<Failuer, void>> signInWithGoogle();

  Future<Either<Failuer, void>> signInWithFacebook();

  Future<Either<Failuer, UserEntity>> getUser();

}
