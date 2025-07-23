import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rfaye3/core/errors/error_handler.dart';
import 'package:rfaye3/features/auth/domain/usecases/login_usecase.dart';
import 'package:rfaye3/features/auth/presentation/cubit/login_cubit/login_states.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final user = await loginUseCase(email, password);
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(ErrorHandler.handle(e).message));
    }
  }
}
