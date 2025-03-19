import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static const String routeName = 'SignUpPage';
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
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Physico App',
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Row(
                children: [
                  Text(
                    'Register',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: firstNameController,
                hint: 'First Name',
                text: 'First Name must be not empty',
              ),
              SizedBox(height: 14.h),
              CustomTextField(
                controller: lastNameController,
                hint: 'Last Name',
                text: 'Last Name must be not empty',
              ),
              SizedBox(height: 14.h),
              SizedBox(height: 14.h),
              CustomTextField(
                controller: emailController,
                hint: 'Email',
                text: 'Email must be not empty',
              ),
              SizedBox(height: 14.h),
              CustomTextField(
                controller: passwordController,
                hint: 'Password',
                text: 'Password must be not empty',
                obscureText: false,
              ),
              SizedBox(height: 14.h),
              CustomTextField(
                controller: confirmPasswordController,
                hint: 'confirm Password',
                text: 'Password must be not empty',
                obscureText: false,
              ),
              SizedBox(height: 14.h),
              SizedBox(height: 15.h),
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                },
                text: 'Register',
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
