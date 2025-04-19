import 'package:courseapp/features/auth/data/data_source/signup_repo._data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthDataSource implements AuthRemoteDataSource {
  final SupabaseClient client;

  SupabaseAuthDataSource({required this.client});

  Future<void> signUp(
      {required String username,
      required String email,
      required String password}) async {
    try {
      final response = await client.auth.signUp(
        email: email,
        password: password,
        data: {'first_name': username},
      );

      if (response.user == null) {
        throw Exception('Signup failed');
      }
    } catch (e) {
      throw Exception('Signup error: ${e.toString()}');
    }
  }
}
