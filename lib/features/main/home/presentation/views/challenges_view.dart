import 'package:courseapp/features/main/home/presentation/widget/challenges_view_body.dart';
import 'package:flutter/material.dart';

class ChallengesView extends StatelessWidget {
  const ChallengesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: ChallengesViewBody(),
    );
  }
}
