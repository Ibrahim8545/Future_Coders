import 'package:courseapp/features/auth/domain/repo/signup_repo.dart';
import 'package:gotrue/src/types/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

      final user = response.user;
      if (user == null) {
        throw Exception("Signup failed. No user returned.");
      }

      return user;
    } catch (e) {
      throw Exception("Signup failed: ${e.toString()}");
    }
  }
}



//  @override
//   Future<void> signUp(
//       {required String firstName,
//       required String email,
//       required String password})async {
//      return await dataSource.signUp(

//       firstName: firstName,
//       email: email,
//       password: password,
//     );
//   }
