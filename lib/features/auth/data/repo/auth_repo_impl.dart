import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/errors/custom_exception.dart';
import 'package:rfaye3/features/auth/domain/entities/user_entity.dart';
import 'package:rfaye3/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failuer, UserEntity>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, void>> resendOtp({required String email}) {
    // TODO: implement resendOtp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, void>> resetPassword({required String email}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failuer, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
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
  Future<Either<Failuer, UserEntity>> signupWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) {
    // TODO: implement signupWithEmailAndPassword
    throw UnimplementedError();
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
