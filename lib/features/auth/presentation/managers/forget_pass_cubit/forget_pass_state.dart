abstract class ForgetPassState {}

final class ForgetPassInitial extends ForgetPassState {}

class ForgetPassLoading extends ForgetPassState {}

class ForgetPassFailure extends ForgetPassState {
  final String message;
  ForgetPassFailure({required this.message});
}

class ForgetPassSuccess extends ForgetPassState {}
