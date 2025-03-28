import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                  SizedBox(height: 60.h),
                  Text('إعادة ضبط كلمة المرور',
                      style: getBoldStyle(color: Colors.black, fontSize: 24)),
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
                    'ادخل الكود الرقمي المكون من 4 ارقام المرسل للبريد الالكترونى الخاص بك',
                    textAlign: TextAlign.center,
                    style:
                        getRegularStyle(color: Color(0xff999999), fontSize: 16),
                  ),
                  SizedBox(height: 60.h),
                  OtpTextField(
                    fillColor: Color(0xffB3B3B3), // لون خلفية المربع
                    filled: true,
                    textStyle: TextStyle(color: Colors.white),
                    numberOfFields: 5,
                    borderColor: Color(0xffB3B3B3),
                    showFieldAsBox: true,
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    onSubmit: (String verificationCode) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        },
                      );
                    }, // end onSubmit
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 24.h),
                      Text(
                        '  ارسل مجددا',
                        style: getRegularStyle(
                            color: Color(0xff0A638F), fontSize: 16),
                      ),
                      Text(
                        '  لم تستلم الكود؟',
                        style: getRegularStyle(
                            color: Color(0xff999999), fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.h),
                  CustomButton(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.repassword);
                      },
                      text: 'استمرار')
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
