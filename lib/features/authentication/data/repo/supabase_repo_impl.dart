
import 'package:dartz/dartz.dart';
import 'package:rfaye3/core/helper/user_data.dart';
import 'package:rfaye3/core/supabase/database_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rfaye3/core/errors/custom_exception.dart';
import 'package:rfaye3/core/supabase/supabase_auth_services.dart';
import 'package:rfaye3/features/authentication/domain/entities/user_entity.dart';
import 'package:rfaye3/features/authentication/domain/repo/auth_repo.dart';

class SupabaseRepoImpl implements AuthRepo {
  final SupabaseAuthServices services;
  final DatabaseServices databaseServices;
  SupabaseRepoImpl(this.services, this.databaseServices);

  @override
  Future<Either<Failuer, UserEntity>> signupWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserEntity user = await services.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      await addUserToDatabase(user);
      return right(user);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserEntity user = await services.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await UserLocaldata.setUserData(user);
      return right(user);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuer, void>> signOut() async {
    try {
      await services.signOut();
      return right(null);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuer, void>> resetPassword({required String email}) async {
    try {
      await services.resetPassword(email: email);
      return right(null);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuer, void>> updatePassword({
    required String newPassword,
  }) async {
    try {
      await services.updatePassword(newPassword: newPassword);
      return right(null);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuer, void>> verifyEmail({
    required String code,
    required String email,
  }) async {
    try {
      await services.verifyEmail(code: code, email: email);
      return right(null);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuer, void>> resendOtp({required String email}) async {
    try {
      await services.resendOtp(email: email);

      return right(null);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuer, void>> signInWithFacebook() async {
    try {
      await services.signInWithFacebook();
      return right(null);
    } catch (e) {
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuer, void>> signInWithGoogle() async {
    try {
      User user = await services.signInWithGoogle();
      await addUserToDatabase(UserEntity.fromSupabaseUser(user));
      return right(null);
    } catch (e) {

      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> getUser() async {
    try {
      UserEntity user = await services.getUser();
      return right(user);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'حدث خطأ ما حاول مرة أخرى'));
    }
  }

  Future<void> addUserToDatabase(UserEntity user) async {
    await databaseServices.setRecord(tableName: 'users', data: user.toMap());
    await UserLocaldata.setUserData(user);
  }
}
