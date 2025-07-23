import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/errors/error_handler.dart';
import 'package:rfaye3/features/auth/domain/usecases/signup_usecase.dart';
import 'package:rfaye3/features/auth/presentation/cubit/sign_up_cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit(this.signUpUseCase) : super(SignUpInitial());

  Future<void> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    emit(SignUpLoading());
    try {
      final message = await signUpUseCase(firstName, lastName, email, password);
      emit(SignUpSuccess(message));
    } catch (e) {
      emit(SignUpFailure(ErrorHandler.handle(e).message));
      print(e);
      print(ErrorHandler.handle(e).message);
    }
  }
}
