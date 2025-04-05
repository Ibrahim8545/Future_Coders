import 'package:courseapp/config/routes/routes.dart';
import 'package:courseapp/features/auth/prestation/widget/custom_buttom.dart';
import 'package:courseapp/features/onboarding/data/model.dart';
import 'package:courseapp/features/onboarding/prestatation/widget/onboarding_custom_button_skip.dart';
import 'package:courseapp/features/onboarding/prestatation/widget/custom_indicator.dart';
import 'package:courseapp/features/onboarding/prestatation/widget/onboard.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_manager.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: 'assets/images/onboarding_part1.png',
      title: 'جاهز للبدء؟',
      description:
          'ابدأ رحلتك البرمجية الآن وانطلق إلى عالم المبرمجين المحترفين!',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding_part2.png',
      title: 'مستويات ممتعة وتحديات شيقة',
      description:
          'ابدأ رحلتك خطوة بخطوة حتى تصل إلى مفاهيم متقدمة في عالم البرمجة.',
    ),
    OnboardingModel(
      image: 'assets/images/onboarding_part3.png',
      title: 'تعلّم بينما أنت تلعب',
      description:
          'استمتع بالدورات التفاعلية والألعاب التعليمية لجعل التعلم ممتعًا!',
    ),
  ];

  void _nextPage() {
    if (currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  void _finishOnboarding() {
    Navigator.pushReplacementNamed(context, Routes.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (index) => setState(() => currentIndex = index),
              itemBuilder: (context, index) =>
                  OnboardingPage(model: pages[index]),
            ),
          ),
          CustomIndicator(controller: _controller, count: pages.length),
          const SizedBox(height: 24),
          Column(
            children: [
              CustomButton(
                  onTap: _nextPage, text: 'استمرار', color: Colors.blue),
              if (currentIndex != pages.length - 1)
                CustomSkipBotton(
                  onTap: _finishOnboarding,
                  text: 'تخطى',
                  color: Colors.transparent,
                ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
