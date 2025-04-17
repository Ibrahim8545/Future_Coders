import 'package:courseapp/features/main/home/presentation/widget/home_tab_body.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeTabBody(),
    );
  }
}
