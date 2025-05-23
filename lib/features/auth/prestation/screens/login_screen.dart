import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/data/login_imp.dart';
import 'package:courseapp/features/auth/data/repo_imp/signup_repo_imp.dart';
import 'package:courseapp/features/auth/domain/use_case/login_use_case.dart';
import 'package:courseapp/features/auth/domain/use_case/signup_usecase.dart';
import 'package:courseapp/features/auth/prestation/manager/cubit/signup_bloc_cubit.dart';
import 'package:courseapp/features/auth/prestation/manager/cubit/signup_bloc_state.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_snack_bar_widget.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'LoginPage';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepositoryImpl(
      client: Supabase.instance.client,
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
              Navigator.pushReplacementNamed(context, Routes.quiz);
            } else if (state is AuthError) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Row(
                    children: [
                      Text('Login Failed',
                          style: getMediumStyle(color: ColorManager.black500)),
                      Icon(
                        Icons.error,
                        color: ColorManager.red600,
                      )
                    ],
                  ),
                  content: Text("خطأ في كلمه المرور او الايميل",
                      style: getMediumStyle(color: ColorManager.black500)),
                ),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const SizedBox(height: 75),
                    Image.asset(
                      'assets/images/siginin_logo.png',
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'ادخل البريد الالكتروني';
                        }
                        return null;
                      },
                      controller: emailController,
                      hint: 'ادخل بريدك الالكتروني',
                      text: 'Email must not be empty',
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'ادخل كلمه المرور';
                        }
                        return null;
                      },
                      controller: passwordController,
                      hint: 'ادخل كلمه المرور',
                      text: 'Password must not be empty',
                      obscureText: true,
                    ),
                    SizedBox(height: 10.h),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.forgetPassword);
                      },
                      child: Text(
                        'هل نسيت كلمه السر؟',
                        textAlign: TextAlign.end,
                        style: getMediumStyle(
                            color: ColorManager.black500, fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    state is AuthLoading
                        ? const Center(child: CircularProgressIndicator())
                        : CustomButton(
                            color: const Color(0xff0A638F),
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                final repository = AuthLoginRepositoryImpl(
                                  client: Supabase.instance.client,
                                );
                                final loginUseCase = LoginUseCase(repository);

                                try {
                                  final userId = await loginUseCase.execute(
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                  );
                                  if (userId != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: SnackBarContentWidget(content: 'تم تسجيل الدخول بنجاح',),
                                        ),
                                      ),
                                    );
                                    Navigator.pushReplacementNamed(
                                        context, Routes.quiz);
                                  }
                                } catch (e) {
                                  showDialog(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: Directionality(
                                        textDirection: TextDirection.rtl,
                                        child: Row(
                                          children: [
                                            Text('فشل تسجيل الدخول',
                                                style: getMediumStyle(
                                                  color: ColorManager.black500,
                                                  fontSize: 25.sp,
                                                )),
                                            SizedBox(width: 10.w),
                                            const Icon(
                                              Icons.error,
                                              color: Color(0xffDD3434),
                                            )
                                          ],
                                        ),
                                      ),
                                      content: Text(
                                          "خطأ في كلمه المرور او الايميل ",
                                          style: getMediumStyle(
                                              color: ColorManager.black500,
                                              fontSize: 18.sp)),
                                      actions: [
                                        Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              const Color(
                                                                  0xffDD3434),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                          )),
                                                  child: Text(
                                                    "حسناً",
                                                    style: getMediumStyle(
                                                        color:
                                                            ColorManager.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }
                              }
                            },
                            text: 'تسجيل الدخول ',
                          ),
                    SizedBox(height: 16.h),
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
                            if (state is! AuthLoading) {
                              context.read<AuthCubit>().signInWithGoogle();
                            }
                          },
                          child: Image.asset('assets/images/google.png'),
                        ),
                        SizedBox(width: 32.w),
                        InkWell(
                          onTap: () {},
                          child: Image.asset('assets/images/apple.png'),
                        ),
                        SizedBox(width: 32.w),
                        InkWell(
                          onTap: () {
                            if (state is! AuthLoading) {
                              context.read<AuthCubit>().signInWithFacebook();
                            }
                          },
                          child: Image.asset('assets/images/face.png'),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.signUp);
                          },
                          child: Text(
                            '  انشاء حساب',
                            style: getBoldStyle(
                                color: ColorManager.primary700, fontSize: 16),
                          ),
                        ),
                        Text('  ليس لديك حساب جديد؟',
                            style: getBoldStyle(
                                color: ColorManager.black500, fontSize: 16)),
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

