import 'package:courseapp/features/auth/domain/repo/reset_password.dart';
import 'package:courseapp/features/auth/domain/use_case/reset_paa_use_case.dart';
import 'package:courseapp/features/auth/prestation/manager/reset_passord_cubit/reset_pass_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<ResetAuthState> {
  final SendPasswordResetEmailUseCase sendPasswordResetEmailUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  AuthCubit({
    required this.sendPasswordResetEmailUseCase,
    required this.verifyOtpUseCase,
    required this.resetPasswordUseCase,
  }) : super(AuthInitial());

  Future<void> sendPasswordResetEmail(String email) async {
    emit(AuthLoading());
    try {
      await sendPasswordResetEmailUseCase.execute(email);
      emit(AuthResetEmailSent());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> verifyOtp(String email, String token) async {
    emit(AuthLoading());
    try {
      await verifyOtpUseCase.execute(email, token);
      emit(AuthOtpVerified());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> resetPassword(String password) async {
    emit(AuthLoading());
    try {
      await resetPasswordUseCase.execute(password);
      emit(AuthPasswordReset());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
