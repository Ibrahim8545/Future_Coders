import 'package:courseapp/features/auth/domain/repo/reset_password.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  final SupabaseClient client;

  AuthRepoImpl(this.client);

  @override
  Future<void> resetPassword({required String email}) async {
    await client.auth.resetPasswordForEmail(email);
  }
}
