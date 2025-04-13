import 'package:courseapp/features/main/community/presentaion/widgets/custom_questions_container.dart';
import 'package:flutter/material.dart';

class QuestionsTab extends StatefulWidget {
  const QuestionsTab({super.key});

  @override
  State<QuestionsTab> createState() => _QuestionsTabState();
}

class _QuestionsTabState extends State<QuestionsTab> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomQuestionsContainer()
            ],
          ),
        ),
      )
    );
  }
}
