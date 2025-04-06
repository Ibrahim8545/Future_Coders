import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
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
               SizedBox(height: 10.h),
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
                   Text('او',style: getBoldStyle(color: ColorManager.black500,fontSize: 16)),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child:  Text(
                      '   تسجيل دخول',
                      style:getBoldStyle(color: ColorManager.primary700,fontSize: 16),
                    ),
                  ),
                   Text(
                    ' هل لديك حساب بالفعل؟',
                    style: getBoldStyle(color: ColorManager.black500,fontSize: 16),
                  ),
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
