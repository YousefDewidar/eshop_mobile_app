import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/auth/data/repo/auth_repo.dart';
import 'package:rfaye3/features/auth/presentation/managers/forget_pass_cubit/forget_pass_state.dart';
import 'package:rfaye3/core/network/failuer.dart';

class ForgetPassCubit extends Cubit<ForgetPassState> {
  final AuthRepo authRepo;
  ForgetPassCubit(this.authRepo) : super(ForgetPassInitial());

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPassLoading());

    Either<Failuer, void> response = await authRepo.forgetPassword(
      email: email,
    );
    response.fold(
      (failuer) {
        emit(ForgetPassFailure(message: failuer.message));
      },
      (success) {
        emit(ForgetPassSuccess());
      },
    );
  }

  Future<void> validateOtp({
    required String code,
    required String email,
  }) async {
    emit(ForgetPassLoading());
    Either<Failuer, void> response = await authRepo.validateOtp(
      email: email,
      code: code,
    );
    response.fold(
      (failuer) {
        emit(ForgetPassFailure(message: failuer.message));
      },
      (success) {
        emit(ForgetPassSuccess());
      },
    );
  }

  Future<void> resetPassword({
    required String newPassword,
    required String email,
    required String otp,
  }) async {
    emit(ForgetPassLoading());

    Either<Failuer, void> response = await authRepo.resetPassword(
      email: email,
      code: otp,
      newPassword: newPassword,
    );
    response.fold(
      (failuer) {
        emit(ForgetPassFailure(message: failuer.message));
      },
      (success) {
        emit(ForgetPassSuccess());
      },
    );
  }
}
