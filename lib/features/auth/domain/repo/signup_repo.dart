import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SignUPAuthRepo {
  Future<User> signUp({
    required String firstName,
    required String email,
    required String password,
  });
}
