import 'package:courseapp/features/onboarding/data/model.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          Image.asset(model.image, height: 300),
          const SizedBox(height: 30),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            model.description,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
