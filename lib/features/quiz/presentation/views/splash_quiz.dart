import 'package:courseapp/config/routes/routes.dart';
import 'package:flutter/material.dart';

class SplashQuizScreen extends StatefulWidget {
  const SplashQuizScreen({Key? key}) : super(key: key);

  @override
  State<SplashQuizScreen> createState() => _SplashQuizScreenState();
}

class _SplashQuizScreenState extends State<SplashQuizScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.mainRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الصفحة الرئيسية'),
        centerTitle: true,
      ),
      body: const Center(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              'تم إكمال الاختبار بنجاح!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'أهلاً بك في تطبيق التعلم',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
