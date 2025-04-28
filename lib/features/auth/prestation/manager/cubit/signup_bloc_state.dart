abstract class AppAuthState {}

class AuthInitial extends AppAuthState {}

class AuthLoading extends AppAuthState {}

class AuthSuccess extends AppAuthState {}

class AuthError extends AppAuthState {
  final String message;
  AuthError(this.message);
}

class AuthUserNameLoaded extends AppAuthState {
  final String username;
  AuthUserNameLoaded(this.username);
}

class AuthUsernameUpdated extends AppAuthState {
  final String username;
  AuthUsernameUpdated(this.username);
}