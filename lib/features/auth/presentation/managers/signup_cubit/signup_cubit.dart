import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/auth/data/repo/auth_repo.dart';
import 'package:rfaye3/features/auth/presentation/managers/signup_cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  AuthRepo authRepo;
  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> signupWithEmailAndPassword({
    required String email,
    required String password,
    required String fName,
    required String lName,
  }) async {
    emit(SignupLoading());

    final response = await authRepo.signupWithEmailAndPassword(
      email: email,
      password: password,
      fName: fName,
      lName: lName,
    );

    response.fold(
      (failuer) {
        emit(SignupFailure(message: failuer.message));
      },
      (user) {
        emit(SignupSuccess());
      },
    );
  }

  void rebuidButton() {
    emit(SignupInitial());
  }
}
