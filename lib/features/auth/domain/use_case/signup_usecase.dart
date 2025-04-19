import 'package:courseapp/features/auth/domain/repo/login_repo.dart';
import 'package:courseapp/features/auth/domain/repo/signup_repo.dart';
import 'package:gotrue/src/types/user.dart';

class SignUpUseCase {
  final SignUPAuthRepo repository;

  SignUpUseCase(this.repository);

  Future<Future<User>> execute({
    required String firstName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      throw Exception("Passwords don't match");
    }

    if (password.length < 6) {
      throw Exception("Password should be at least 6 characters");
    }

    return repository.signUp(
      firstName: firstName,
      email: email,
      password: password,
    );
  }
}
