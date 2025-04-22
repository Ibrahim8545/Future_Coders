import 'package:courseapp/features/auth/domain/repo/reset_password.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthRepository implements AuthRepo {
  final SupabaseClient _supabaseClient;

  SupabaseAuthRepository(this._supabaseClient);

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _supabaseClient.auth.resetPasswordForEmail(email,
          redirectTo: 'courseapp://reset-password');
    } catch (e) {
      throw Exception('فشل إرسال بريد إعادة تعيين كلمة المرور: $e');
    }
  }

  @override
  Future<void> verifyOtp(String email, String token, String type) async {
    try {
      await _supabaseClient.auth.verifyOTP(
        email: email,
        token: token,
        type: OtpType.recovery,
      );
    } catch (e) {
      throw Exception('فشل التحقق من رمز OTP: $e');
    }
  }

  @override
  Future<void> resetPassword(String password) async {
    try {
      await _supabaseClient.auth.updateUser(UserAttributes(password: password));
    } catch (e) {
      throw Exception('فشل إعادة تعيين كلمة المرور: $e');
    }
  }
}
