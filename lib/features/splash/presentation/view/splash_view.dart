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

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  final String word1 = 'Future';
  final String word2 = 'Coders';
  int _currentIndex = 0;

  final List<Color> colors = [
    ColorManager.primary700,
    ColorManager.secondary400,
    ColorManager.yellow200,
    ColorManager.secondary400,
    ColorManager.yellow200,
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

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(
      reverse: true,
    count: 2
    );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(-0.6, 0.0),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
  void animateText() async {
    for (int i = 0; i <= word1.length; i++) {
      await Future.delayed(const Duration(milliseconds: 1300));
      setState(() {
        _currentIndex = i;
      });
    }
    Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
  }

  dispose() {
    _controller.dispose();
    super.dispose();
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
                  child: SlideTransition(
                      position: _offsetAnimation,
                      child: Image.asset(ImageAssets.logo)),
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(_currentIndex, (index) {
                        return Text(
                          word1[index],
                          style: TextStyle(
                            color: colors[index % colors.length],
                            fontFamily: "Cherry Bomb",
                            fontSize: 64,
                            fontWeight: FontWeight.w900,
                          ),
                        );
                      }),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(_currentIndex, (index) {
                        return Text(
                          word2[index],
                          style: TextStyle(
                            color: colors[(index + 6) % colors.length],
                            fontFamily: "Cherry Bomb",
                            fontSize: 64,
                            fontWeight: FontWeight.w900,
                          ),
                        );
                      }),
                    ),
                  ],
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
