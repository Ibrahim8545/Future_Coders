import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/data/repo_imp/rest_password_repo_impl.dart';
import 'package:courseapp/features/auth/domain/use_case/reset_paa_use_case.dart';
import 'package:courseapp/features/auth/prestation/manager/reset_passord_cubit/reset_pass_cubit.dart';
import 'package:courseapp/features/auth/prestation/manager/reset_passord_cubit/reset_pass_state.dart';
import 'package:courseapp/features/auth/prestation/screens/otp_screen.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final supabaseClient = Supabase.instance.client;
    final authRepository = SupabaseAuthRepository(supabaseClient);
    final sendPasswordResetEmailUseCase =
        SendPasswordResetEmailUseCase(authRepository);
    final verifyOtpUseCase = VerifyOtpUseCase(authRepository);
    final resetPasswordUseCase = ResetPasswordUseCase(authRepository);

    return BlocProvider(
      create: (context) => AuthCubit(
        sendPasswordResetEmailUseCase: sendPasswordResetEmailUseCase,
        verifyOtpUseCase: verifyOtpUseCase,
        resetPasswordUseCase: resetPasswordUseCase,
      ),
      child: Builder(
        builder: (context) {
          final emailController = TextEditingController();

          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Stack(
                children: [
                  Positioned(
                    bottom: -11.w,
                    left: 100.w,
                    child: Image.asset('assets/images/curvebottom.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 160.h),
                         Text(
                          'نسيت كلمه المرور',
                          style: getBoldStyle(color: ColorManager.black500,fontSize: 22),
                        ),
                        SizedBox(height: 16.h),
                        Image.asset('assets/images/man thinking avatar.png'),
                        SizedBox(height: 16.h),
                         Text(
                          'ادخل بريدك الالكتروني',
                          style: getBoldStyle(color: ColorManager.black500,fontSize: 22),
                        ),
                        SizedBox(height: 14.h),
                        CustomTextField(
                          hint: 'البريد الالكترونى هنا ',
                          text: 'البريد الإلكتروني لا يمكن أن يكون فارغًا',
                          controller: emailController,
                        ),
                        SizedBox(height: 20.h),
                        BlocConsumer<AuthCubit, ResetAuthState>(
                          listener: (context, state) {
                            if (state is AuthResetEmailSent) {
                              final email = emailController.text;
                              if (email.isNotEmpty) {
                                print('Navigating to OTP with email: $email');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OtpScreen(
                                        emailArg: emailController.text),
                                  ),
                                );

                                Navigator.pushNamed(context, Routes.otp,
                                    arguments: email);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('البريد الإلكتروني فارغ')),
                                );
                              }
                            } else if (state is AuthError) {
                              print('Error: ${state.message}');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message)),
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return const CircularProgressIndicator();
                            }
                            return CustomButton(
                              color: const Color(0xff0A638F),
                              onTap: () {
                                final email = emailController.text.trim();
                                if (email.isNotEmpty &&
                                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                        .hasMatch(email)) {
                                  print('Sending reset email for: $email');
                                  context
                                      .read<AuthCubit>()
                                      .sendPasswordResetEmail(email);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'الرجاء إدخال بريد إلكتروني صحيح')),
                                  );
                                }
                              },
                              text: 'استمرار',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    child: Image.asset(ImageAssets.curveImage),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
