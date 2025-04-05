import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                text: 'First Name must be not empty',
              ),
              SizedBox(height: 14.h),
              CustomTextField(
                controller: emailController,
                hint: 'ادخل بريدك الالكتروني',
                text: 'Email must be not empty',
              ),
              SizedBox(height: 14.h),
              CustomTextField(
                controller: passwordController,
                hint: 'ادخل كلمة المرور',
                text: 'Password must be not empty',
                obscureText: false,
              ),
              SizedBox(height: 14.h),
              CustomTextField(
                controller: confirmPasswordController,
                hint: 'تاكيد كلمة المرور',
                text: 'Password must be not empty',
                obscureText: false,
              ),
              SizedBox(height: 14.h),
              CustomButton(
                color: const Color(0xff0A638F),
                onTap: () {
                  //Navigator.pushNamed(context, Routes.otp);
                  // if (formKey.currentState!.validate()) {}
                },
                text: 'انشاء حساب',
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
