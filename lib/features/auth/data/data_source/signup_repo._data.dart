abstract class AuthRemoteDataSource {
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  });
}
