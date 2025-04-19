class UserModel {
  final String id;
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  bool get isPasswordConfirmed => password == confirmPassword;
}
