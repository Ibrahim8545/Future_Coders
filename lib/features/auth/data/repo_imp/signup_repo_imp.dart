import 'package:courseapp/features/auth/data/data_source/signup_repo._data.dart';
import 'package:courseapp/features/auth/domain/repo/signup_repo.dart';
import 'package:gotrue/src/types/user.dart';

class AuthRepositoryImpl implements SignUPAuthRepo {
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<User> signUp(
      {required String firstName,
      required String email,
      required String password}) async {
    await dataSource.signUp(
        username: firstName, email: email, password: password);
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