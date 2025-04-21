import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/data/repo_imp/rest_password_repo_impl.dart';
import 'package:courseapp/features/auth/domain/use_case/reset_paa_use_case.dart';
import 'package:courseapp/features/auth/prestation/manager/reset_passord_cubit/reset_pass_cubit.dart';
import 'package:courseapp/features/auth/prestation/manager/reset_passord_cubit/reset_pass_state.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.emailArg});
  final String emailArg;

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
          if (emailArg == null || emailArg is! String || emailArg.isEmpty) {
            print('Error: Invalid or null email argument: $emailArg');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('خطأ: لم يتم تمرير بريد إلكتروني صحيح')),
              );
              Navigator.pop(context); // Go back if email is invalid
            });
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          final email = emailArg;
          print('Received email in OtpScreen: $email');

          return Scaffold(
            body: Center(
              child: Stack(
                children: [
                  Positioned(
                    bottom: -11.w,
                    left: 100,
                    child: Image.asset('assets/images/curvebottom.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(height: 60.h),
                        Text('إعادة ضبط كلمة المرور',
                            style: getBoldStyle(
                                color: Colors.black, fontSize: 24)),
                        SizedBox(height: 16.h),
                        Image.asset(
                            'assets/images/Male specialist working in support service.png'),
                        SizedBox(height: 24.h),
                        Text(
                          'ادخل الكود',
                          style: getBoldStyle(color: Colors.black),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'ادخل الكود الرقمي المكون من 6 ارقام المرسل للبريد الالكترونى الخاص بك',
                          textAlign: TextAlign.center,
                          style: getRegularStyle(
                              color: Color(0xff999999), fontSize: 16),
                        ),
                        SizedBox(height: 60.h),
                        BlocConsumer<AuthCubit, ResetAuthState>(
                          listener: (context, state) {
                            if (state is AuthOtpVerified) {
                              print('OTP verified, navigating to Repassword');
                              Navigator.pushNamed(context, Routes.repassword);
                            } else if (state is AuthError) {
                              print('Error: ${state.message}');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.message)),
                              );
                            } else if (state is AuthResetEmailSent) {
                              print('OTP resent for email: $email');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('تم إعادة إرسال رمز OTP بنجاح')),
                              );
                            }
                          },
                          builder: (context, state) {
                            return OtpTextField(
                              fillColor: Color(0xffB3B3B3),
                              filled: true,
                              textStyle: TextStyle(color: Colors.white),
                              numberOfFields: 6,
                              borderColor: Color(0xffB3B3B3),
                              showFieldAsBox: true,
                              onSubmit: (String verificationCode) {
                                print('Submitting OTP: $verificationCode');
                                context
                                    .read<AuthCubit>()
                                    .verifyOtp(email, verificationCode);
                              },
                            );
                          },
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 24.h),
                            GestureDetector(
                              onTap: () {
                                print('Resending OTP for email: $email');
                                context
                                    .read<AuthCubit>()
                                    .sendPasswordResetEmail(email);
                              },
                              child: Text(
                                'ارسل مجددا',
                                style: getRegularStyle(
                                    color: Color(0xff0A638F), fontSize: 16),
                              ),
                            ),
                            Text(
                              '  لم تستلم الكود؟',
                              style: getRegularStyle(
                                  color: Color(0xff999999), fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 50.h),
                        BlocBuilder<AuthCubit, ResetAuthState>(
                          builder: (context, state) {
                            if (state is AuthLoading) {
                              return const CircularProgressIndicator();
                            }
                            return CustomButton(
                              color: const Color(0xff0A638F),
                              onTap: () {},
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
