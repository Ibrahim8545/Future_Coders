import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/data/repo_imp/rest_password_repo_impl.dart';
import 'package:courseapp/features/auth/domain/use_case/reset_paa_use_case.dart';
import 'package:courseapp/features/auth/prestation/manager/reset_passord_cubit/reset_pass_cubit.dart';
import 'package:courseapp/features/auth/prestation/manager/reset_passord_cubit/reset_pass_state.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';

import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RepasswordScreen extends StatelessWidget {
  const RepasswordScreen({super.key});

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
          final passwordController = TextEditingController();
          final confirmPasswordController = TextEditingController();

          return Scaffold(
            body: Stack(
              children: [
                Positioned(
                  bottom: -11.w,
                  left: 100,
                  child: Image.asset('assets/images/curvebottom.png'),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(height: 58.h),
                        Text(
                          'إعادة ضبط كلمة المرور',
                          style: getBoldStyle(color: Colors.black),
                        ),
                        SizedBox(height: 14.h),
                        Image.asset(
                            'assets/images/Young woman pointing at idea light bulb.png'),
                        SizedBox(height: 20.h),
                        Text(
                          'ادخل كلمه المرور الجديده',
                          style: getBoldStyle(color: Colors.black),
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          textAlign: TextAlign.center,
                          'ادخل كلمه مرور جديده مختلفة عن كلمه المرور السابقة',
                          style: getRegularStyle(color: Color(0xff999999))
                              .copyWith(
                                  fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        SizedBox(height: 24.h),
                        CustomTextField(
                          hint: 'ادخل كلمه المرور الجديده',
                          text: 'كلمة المرور لا يمكن أن تكون فارغة',
                          controller: passwordController,
                          obscureText: true,
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          hint: 'تاكيد كلمه المرور الجديده',
                          text: 'كلمة المرور لا يمكن أن تكون فارغة',
                          controller: confirmPasswordController,
                          obscureText: true,
                        ),
                        SizedBox(height: 24.h),
                        BlocConsumer<AuthCubit, ResetAuthState>(
                          listener: (context, state) {
                            if (state is AuthPasswordReset) {
                              Navigator.pushReplacementNamed(context,
                                  Routes.confirmChangePasswordSplashScreen);
                            } else if (state is AuthError) {
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
                                if (passwordController.text.isEmpty ||
                                    confirmPasswordController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'الرجاء إدخال كلمة المرور وتأكيدها')),
                                  );
                                  return;
                                }
                                if (passwordController.text ==
                                    confirmPasswordController.text) {
                                  context
                                      .read<AuthCubit>()
                                      .resetPassword(passwordController.text);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('كلمتا المرور غير متطابقتين')),
                                  );
                                }
                              },
                              text: 'تاكيد',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: Image.asset(ImageAssets.curveImage),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
