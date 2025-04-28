import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/data/repo_imp/signup_repo_imp.dart';
import 'package:courseapp/features/auth/domain/use_case/signup_usecase.dart';
import 'package:courseapp/features/auth/prestation/manager/cubit/signup_bloc_cubit.dart';
import 'package:courseapp/features/auth/prestation/manager/cubit/signup_bloc_state.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepositoryImpl(
      client: supabase.Supabase.instance.client,
    );

    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthCubit(
          signUpUseCase: SignUpUseCase(authRepository),
          authRepository: authRepository,
        ),
        child: BlocConsumer<AuthCubit, AppAuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تم إنشاء الحساب بنجاح')));
              Navigator.pushNamed(context, Routes.signIn);
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    SizedBox(height: 45.h),
                    Image.asset('assets/images/reqqq.jpg'),
                    SizedBox(height: 20.h),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: firstNameController,
                      hint: 'اسم الطالب',
                      text: 'First Name must not be empty',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'First Name must not be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 14.h),
                    CustomTextField(
                      controller: emailController,
                      hint: 'ادخل بريدك الالكتروني',
                      text: 'Email must not be empty',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email must not be empty';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 14.h),
                    CustomTextField(
                      controller: passwordController,
                      hint: 'ادخل كلمة المرور',
                      text: 'Password must not be empty',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password must not be empty';
                        }
                        if (value.length < 6) {
                          return 'Password should be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 14.h),
                    CustomTextField(
                      controller: confirmPasswordController,
                      hint: 'تاكيد كلمة المرور',
                      text: 'Password must not be empty',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 14.h),
                    state is AuthLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                      color: const Color(0xff0A638F),
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().signUp(
                            firstName: firstNameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            confirmPassword:
                            confirmPasswordController.text,
                          );
                        }
                      },
                      text: 'انشاء حساب',
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Color(0xff999999),
                            thickness: 1,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text('او',
                            style: getBoldStyle(
                                color: ColorManager.black500, fontSize: 16)),
                        SizedBox(width: 4.w),
                        const Expanded(
                          child: Divider(
                            color: Color(0xff999999),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            // Implement Google Sign-In
                            if (state is! AuthLoading) {
                              context.read<AuthCubit>().signInWithGoogle();
                            }
                          },
                          child: Image.asset('assets/images/google.png'),
                        ),
                        SizedBox(width: 32.w),
                        InkWell(
                          onTap: () {
                            // Implement Apple Sign-In (not included in this implementation)
                          },
                          child: Image.asset('assets/images/apple.png'),
                        ),
                        SizedBox(width: 32.w),
                        InkWell(
                          onTap: () {
                            // Implement Facebook Sign-In
                            if (state is! AuthLoading) {
                              context.read<AuthCubit>().signInWithFacebook();
                            }
                          },
                          child: Image.asset('assets/images/face.png'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            '   تسجيل دخول',
                            style: getBoldStyle(
                                color: ColorManager.primary700, fontSize: 16),
                          ),
                        ),
                        Text(
                          ' هل لديك حساب بالفعل؟',
                          style: getBoldStyle(
                              color: ColorManager.black500, fontSize: 16),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
