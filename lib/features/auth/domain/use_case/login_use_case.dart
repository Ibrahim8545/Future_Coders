import 'package:courseapp/features/auth/domain/repo/login_repo.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<String?> execute(String email, String password) {
    return repository.signInWithEmail(email, password);
  }
}
