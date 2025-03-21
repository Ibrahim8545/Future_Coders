import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:courseapp/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Positioned(
              bottom: -11.w,
              left: 100,
              child: Image.asset(
                'assets/images/curvebottom.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 160.h),
                  const Text(
                    'نسيت كلمه المرور',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Image.asset('assets/images/man thinking avatar.png'),
                  SizedBox(height: 16.h),
                  const Text(
                    'ادخل بريدك الالكتروني',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 14.h),
                  CustomTextField(
                    hint: 'البريد الالكترونى هنا ',
                    text: 'Email must be not empty',
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.otp);
                      },
                      text: 'استمرار'),
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
  }
}
