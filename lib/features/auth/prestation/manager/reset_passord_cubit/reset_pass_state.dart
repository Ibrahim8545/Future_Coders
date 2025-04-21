abstract class ResetAuthState {}

class AuthInitial extends ResetAuthState {}

class AuthLoading extends ResetAuthState {}

class AuthResetEmailSent extends ResetAuthState {}

class AuthOtpVerified extends ResetAuthState {}

class AuthPasswordReset extends ResetAuthState {}

class AuthError extends ResetAuthState {
  final String message;

  AuthError(this.message);
}
