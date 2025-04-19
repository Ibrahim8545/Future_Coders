import 'package:courseapp/features/auth/domain/use_case/signup_usecase.dart';
import 'package:courseapp/features/auth/prestation/manager/cubit/signup_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase signUpUseCase;

  AuthCubit({required this.signUpUseCase}) : super(AuthInitial());

  Future<void> signUp({
    required String firstName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AuthLoading());
    try {
      await signUpUseCase.execute(
        firstName: firstName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
