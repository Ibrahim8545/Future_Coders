import 'package:courseapp/features/auth/domain/repo/reset_password.dart';

class SendPasswordResetEmailUseCase {
  final AuthRepo repository;

  SendPasswordResetEmailUseCase(this.repository);

  Future<void> execute(String email) async {
    await repository.sendPasswordResetEmail(email);
  }
}

class VerifyOtpUseCase {
  final AuthRepo repository;

  VerifyOtpUseCase(this.repository);

  Future<void> execute(String email, String token) async {
    await repository.verifyOtp(email, token, 'recovery');
  }
}

class ResetPasswordUseCase {
  final AuthRepo repository;

  ResetPasswordUseCase(this.repository);

  Future<void> execute(String password) async {
    await repository.resetPassword(password);
  }
}
