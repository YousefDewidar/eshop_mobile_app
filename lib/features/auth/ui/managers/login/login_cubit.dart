
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/auth/data/repo/auth_repo.dart';
import 'package:rfaye3/features/auth/ui/managers/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    final response = await authRepo.login(email: email, password: password);

    response.fold(
      (failuer) {
        emit(LoginFailure(message: failuer.message));
      },
      (user) {
        emit(LoginSuccess());
      },
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final response = await authRepo.signInWithGoogle();
    response.fold(
      (failuer) {
        emit(LoginFailure(message: failuer.message));
      },
      (user) {
        emit(LoginSuccess());
      },
    );
  }

  sendCodeToEmail({required String email}) async {
    await authRepo.resetPassword(email: email);
  }

  Future<String?> resendOtp(String email) async {
    final res = await authRepo.resendOtp(email: email);
    res.fold(
      (failuer) {
        emit(LoginFailure(message: failuer.message));
        return failuer.message;
      },
      (user) {
        return null;
      },
    );
    return null;
  }
}
