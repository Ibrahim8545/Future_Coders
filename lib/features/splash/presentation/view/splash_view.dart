import 'package:courseapp/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:courseapp/core/utils/assets_manager.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final String text = 'Future\nCoders';
  int _currentIndex = 0;

  final List<Color> colors = [
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.teal,
    Colors.deepPurple,
    Colors.pink,
    Colors.indigo,
    Colors.cyan,
    Colors.amber,
    Colors.lightBlue,
  ];

  @override
  void initState() {
    super.initState();
    animateText();
  }

  void animateText() async {
    for (int i = 0; i <= text.length; i++) {
      await Future.delayed(const Duration(milliseconds: 180));
      setState(() {
        _currentIndex = i;
      });
    }

    Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: -11.w,
            left: 100,
            child: Image.asset('assets/images/curvebottom.png'),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                  child: Image.asset(ImageAssets.logo),
                ),
                const SizedBox(height: 30),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: List.generate(_currentIndex, (index) {
                      return TextSpan(
                        text: text[index],
                        style: TextStyle(
                          color: text[index] == '\n'
                              ? Colors.transparent
                              : colors[index % colors.length],
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(ImageAssets.curveImage),
          ),
        ],
      ),
    );
  }
}
