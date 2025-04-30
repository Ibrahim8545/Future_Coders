import 'package:courseapp/features/auth/domain/use_case/signup_usecase.dart';
import 'package:courseapp/features/auth/prestation/manager/cubit/signup_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:courseapp/features/auth/domain/repo/signup_repo.dart';

class AuthCubit extends Cubit<AppAuthState> {
  final SignUpUseCase signUpUseCase;
  final SignUPAuthRepo authRepository;
  String? currentUsername;

  AuthCubit({
    required this.signUpUseCase,
    required this.authRepository,
  }) : super(AuthInitial());

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


  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    try {
      final user = await authRepository.signInWithGoogle();

      if (user == null) {
        return;
      }

      await fetchUsername();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }


  Future<void> signInWithFacebook() async {
    emit(AuthLoading());
    try {
      final user = await authRepository.signInWithFacebook();
      if (user == null) {
        return;
      }

      await fetchUsername();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }


  Future<void> fetchUsername() async {
    final userId = Supabase.instance.client.auth.currentUser?.id;

    if (userId == null) {
      print("Error: User not logged in - No user ID found");
      emit(AuthError('User not logged in'));
      return;
    }

    try {
      print("Attempting to fetch username for user ID: $userId");
      final userMetadata = Supabase.instance.client.auth.currentUser?.userMetadata;
      String? nameFromMetadata;

      if (userMetadata != null) {
        // Try to get name from metadata (common for social providers)
        nameFromMetadata = userMetadata['full_name'] ??
            userMetadata['name'] ??
            userMetadata['given_name'];
      }

      if (nameFromMetadata != null) {
        currentUsername = nameFromMetadata;
        print("Username from metadata: $currentUsername");

        try {
          await Supabase.instance.client.from('users').upsert({
            'id': userId,
            'first_name': nameFromMetadata,
            'email': Supabase.instance.client.auth.currentUser?.email,
          });
        } catch (e) {
          print("Error storing user data: ${e.toString()}");
        }

        emit(AuthUserNameLoaded(currentUsername!));
        return;
      }

      // Fall back to database lookup
      final response = await Supabase.instance.client
          .from('users')
          .select('first_name')
          .eq('id', userId)
          .maybeSingle();

      print("Supabase response: $response");

      if (response == null) {
        print("Error: No user data found for ID: $userId");
        emit(AuthError('No user data found'));
        return;
      }

      currentUsername = response['first_name'] ?? 'Unknown';
      print("Username fetched successfully: $currentUsername");
      emit(AuthUserNameLoaded(currentUsername!));
    } catch (e) {
      print("Error fetching username: ${e.toString()}");
      emit(AuthError('Failed to fetch username: ${e.toString()}'));
    }
  }
}