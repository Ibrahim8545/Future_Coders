import 'package:courseapp/features/auth/domain/login_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepositoryImpl implements AuthRepository {
  final SupabaseClient client;

  AuthRepositoryImpl({required this.client});

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
      return Future.error("Unknown error");
    }
  }
}
