import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:courseapp/core/utils/assets_manager.dart';
import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 4),() {
  //     Navigator.pushReplacementNamed(context, Routes.signIn);
  //   },);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Image.asset(ImageAssets.curveImage),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image
                SizedBox(
                  height: 250,
                  child: Image.asset(ImageAssets.logo), // Add your image to assets
                ),
                const SizedBox(height: 30),

                // Animated "Future Coders" text
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 70.0,
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        textStyle: getBoldStyle(color: ColorManager.primary700,fontSize: 40),
                        curve: Curves.bounceIn,
                        'Future Coders',
                        speed: const Duration(microseconds: 800),
                      ),

                    ],
                    totalRepeatCount: 1,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
