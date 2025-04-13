import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'LoginPage';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                controller: emailController,
                hint: 'ادخل بريدك الالكتروني',
                text: 'Email must be not empty',
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                controller: passwordController,
                hint: 'ادخل كلمه المرور',
                text: 'Password must be not empty',
                obscureText: false,
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
              CustomButton(
                color: const Color(0xff0A638F),
                onTap: () {
                  //if (formKey.currentState!.validate()) {}
                  Navigator.pushReplacementNamed(context, Routes.quiz);
                },
                text: 'تسجيل الدخول ',
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  const Expanded(
                    child: const Divider(
                      color: Color(0xff999999),
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Text('او',
                      style: getBoldStyle(
                          color: ColorManager.black500, fontSize: 16)),
                  SizedBox(
                    width: 4.w,
                  ),
                  const Expanded(
                    child: const Divider(
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
                  Image.asset('assets/images/google.png'),
                  SizedBox(width: 32.w),
                  Image.asset('assets/images/apple.png'),
                  SizedBox(width: 32.w),
                  Image.asset(
                    'assets/images/face.png',
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
      ),
    );
  }
}
