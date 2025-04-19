abstract class AuthRepository {
  Future<String?> signInWithEmail(String email, String password);
}
