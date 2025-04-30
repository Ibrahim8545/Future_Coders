import 'package:courseapp/features/auth/domain/repo/signup_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';

class AuthRepositoryImpl implements SignUPAuthRepo {
  final SupabaseClient client;

  AuthRepositoryImpl({required this.client});

  @override
  Future<User> signUp({
    required String firstName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await client.auth.signUp(
        email: email,
        password: password,
        data: {'first_name': firstName},
      );

      if (response.user == null) {
        throw Exception('Signup failed');
      }

      // Create a user record in the 'users' table
      await client.from('users').insert({
        'id': response.user!.id,
        'first_name': firstName,
        'email': email,
      });

      return response.user!;
    } catch (e) {
      throw Exception('Signup error: ${e.toString()}');
    }
  }

  @override
  Future<User?> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        final response = await client.auth.signInWithOAuth(
          OAuthProvider.google,
          redirectTo: '${Uri.base.origin}/auth/callback',
        );

        return null;
      } else {
        // On mobile, we can use the native approach
        final response = await client.auth.signInWithOAuth(
          OAuthProvider.google,
          redirectTo: 'io.supabase.courseapp://login-callback/',
        );

        // This will be non-null only in certain scenarios where auth completes in-app
        return client.auth.currentUser;
      }
    } catch (e) {
      throw Exception('Google sign-in error: ${e.toString()}');
    }
  }

  @override
  Future<User?> signInWithFacebook() async {
    try {
      if (kIsWeb) {
        final response = await client.auth.signInWithOAuth(
          OAuthProvider.facebook,
          redirectTo: '${Uri.base.origin}/auth/callback',
        );

        return null;
      } else {
        final response = await client.auth.signInWithOAuth(
          OAuthProvider.facebook,
          redirectTo: 'io.supabase.courseapp://login-callback/',
        );

        return client.auth.currentUser;
      }
    } catch (e) {
      throw Exception('Facebook sign-in error: ${e.toString()}');
    }
  }

  Future<String?> signInWithEmail(String email, String password) async {
    try {
      final response = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return response.user?.id;
    } catch (e) {
      throw Exception('Login error: ${e.toString()}');
    }
  }
}