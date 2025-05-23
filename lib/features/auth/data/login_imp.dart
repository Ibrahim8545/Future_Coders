import 'package:courseapp/features/auth/domain/repo/login_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthLoginRepositoryImpl implements AuthRepository {
  final SupabaseClient client;

  AuthLoginRepositoryImpl({required this.client});

  @override
  Future<String> signInWithEmail(String email, String password) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response.user!.id;
    } on AuthException catch (e) {
      return Future.error(e.message);
    } catch (e) {
      return Future.error("user not found");
    }
  }
}
