abstract class AuthRepo {
  Future<void> sendPasswordResetEmail(String email);
  Future<void> verifyOtp(String email, String token, String type);
  Future<void> resetPassword(String password);
}
