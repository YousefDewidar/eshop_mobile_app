abstract class VerifyState {}

final class VerifyInitial extends VerifyState {}

class VerifyEmailLoading extends VerifyState {}

class VerifyEmailFailure extends VerifyState {
  final String message;
  VerifyEmailFailure({required this.message});
}

class VerifyEmailSuccess extends VerifyState {}

class ResendSuccess extends VerifyState {}
