import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmChangePasswordSplashScreen extends StatefulWidget {
  const ConfirmChangePasswordSplashScreen({super.key});

  @override
  State<ConfirmChangePasswordSplashScreen> createState() =>
      _ConfirmChangePasswordSplashScreenState();
}

class _ConfirmChangePasswordSplashScreenState
    extends State<ConfirmChangePasswordSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
          context, Routes.signIn, (route) => false);
    });
  }

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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 150.h),
                  Image.asset('assets/images/Young man giving a thumbs up.png'),
                  SizedBox(height: 20.h),
                  Text('احسنت', style: getBoldStyle(color: Colors.black)),
                  SizedBox(height: 26.h),
                  Text(
                      textAlign: TextAlign.center,
                      'تم انشاء كلمة مرور جديدة بامكانك الان تسجيل الدخول ',
                      style: getMediumStyle(color: Color(0xff262626))),
                ],
              ),
            ),
          ),
          Positioned(
            child: Image.asset(ImageAssets.curveImage),
          )
        ],
      ),
    );
  }
}
