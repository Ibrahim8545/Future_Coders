import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_textfield.dart';
import 'package:courseapp/utils/assets_manager.dart';
import 'package:courseapp/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepasswordScreen extends StatelessWidget {
  const RepasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: -11.w,
            left: 100,
            child: Image.asset(
              'assets/images/curvebottom.png',
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 58.h,
                  ),
                  Text(
                    'إعادة ضبط كلمة المرور',
                    style: getBoldStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Image.asset(
                      'assets/images/Young woman pointing at idea light bulb.png'),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'ادخل كلمه المرور الجديده',
                    style: getBoldStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 14.h,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'ادخل كلمه مرور جديده مختلفة عن كلمه المرور السابقة',
                    style: getRegularStyle(color: Color(0xff999999))
                        .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomTextField(
                    hint: 'ادخل كلمه المرور الجديده',
                    text: 'Password must be not empty',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    hint: 'تاكيد كلمه المرور الجديده',
                    text: 'Password must be not empty',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomButton(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.confirmChangePasswordSplashScreen);
                      },
                      text: 'تاكيد')
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
  }
}
