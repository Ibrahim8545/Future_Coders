import 'package:courseapp/features/main/cources/presentation/widgets/progress_view_body.dart';
import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: ProgressViewBody(),
    );
  }
}
