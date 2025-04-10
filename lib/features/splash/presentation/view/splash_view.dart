import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/core/utils/color_manager.dart';
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
    ColorManager.primary700,
    ColorManager.secondary400,
   ColorManager.yellow200,
    ColorManager.secondary400,
   ColorManager.yellow200,
    ColorManager.primary700,
    ColorManager.primary700,
    ColorManager.secondary400,
   ColorManager.yellow200,
    ColorManager.primary700,
   ColorManager.yellow200,
    ColorManager.primary700,
    ColorManager.secondary400,
  ];

  @override
  void initState() {
    super.initState();
    animateText();
  }

  void animateText() async {
    for (int i = 0; i <= text.length; i++) {
      await Future.delayed(const Duration(milliseconds: 600));
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
                          fontFamily: "Cherry Bomb",
                          fontSize: 64,
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
