import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/errors/custom_exception.dart';
import 'package:rfaye3/features/auth/domain/repo/auth_repo.dart';
import 'package:rfaye3/features/auth/ui/managers/verify/verify_state.dart';

class VerifyCubit extends Cubit<VerifyState> {
  final AuthRepo authRepo;
  VerifyCubit(this.authRepo) : super(VerifyInitial());

  Future<void> verifyEmail(
      {required String code, required String email}) async {
    emit(VerifyEmailLoading());
    Either<Failuer, void> response = await authRepo.verifyEmail(
      code: code,
      email: email,
    );
    response.fold((failuer) {
      emit(VerifyEmailFailure(message: failuer.message));
    }, (success) {
      emit(VerifyEmailSuccess());
    });
  }

  Future<void> resendOtp({required String email}) async {
    emit(VerifyEmailLoading());
    Either<Failuer, void> response = await authRepo.resendOtp(
      email: email,
    );
    response.fold((failuer) {
      emit(VerifyEmailFailure(message: failuer.message));
    }, (success) {
      emit(ResendSuccess());
    });
  }
}
