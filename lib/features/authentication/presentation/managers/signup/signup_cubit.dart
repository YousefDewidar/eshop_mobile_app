import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/features/authentication/domain/repo/auth_repo.dart';
import 'package:rfaye3/features/authentication/presentation/managers/signup/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  AuthRepo authRepo;
  SignupCubit(this.authRepo) : super(SignupInitial());

  Future<void> signupWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    emit(SignupLoading());

    final response = await authRepo.signupWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );

    response.fold((failuer) {
      emit(SignupFailure(message: failuer.message));
    }, (user) {
      emit(SignupSuccess());
    });
  }

  void rebuidButton() {
    emit(SignupInitial());
  }
}
