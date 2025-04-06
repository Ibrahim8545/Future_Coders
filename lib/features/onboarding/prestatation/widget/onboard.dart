import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/onboarding/data/model.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(model.image),
            Text(
              model.title,
              style: getBoldStyle(
                color: ColorManager.black500,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
              Text(
              model.description,
              style: getMediumStyle(color: ColorManager.grey400),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
