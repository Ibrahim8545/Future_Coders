import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class SplashQuizScreen extends StatefulWidget {
  const SplashQuizScreen({Key? key}) : super(key: key);

  @override
  State<SplashQuizScreen> createState() => _SplashQuizScreenState();
}

class _SplashQuizScreenState extends State<SplashQuizScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Routes.mainRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'الصفحة الرئيسية',
          style: getMediumStyle(color: ColorManager.black500),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            const SizedBox(height: 20),
            Text(
              'تم إكمال الاختبار بنجاح!',
              style: getBoldStyle(color: ColorManager.black500),
            ),
            const SizedBox(height: 20),
            Text(
              'أهلاً بك في تطبيق التعلم',
              style: getMediumStyle(
                color: ColorManager.black500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
