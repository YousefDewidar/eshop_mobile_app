import 'package:rfaye3/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<String> call(
    String firstName,
    String lastName,
    String email,
    String password,
  ) {
    return repository.signUp(firstName, lastName, email, password);
  }
}
