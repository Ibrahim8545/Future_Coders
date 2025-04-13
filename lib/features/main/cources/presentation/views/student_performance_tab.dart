import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/custom_progress_row.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/progress_stats.dart';
import 'package:flutter/material.dart';

class StudentPerformanceTab extends StatelessWidget {
  const StudentPerformanceTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomProgressRow(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 24),
          child: Text(
            "الاحصائيات العامة",
            style: getMediumStyle(
              color: ColorManager.black500,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        const ProgressStats(),
      ],
    );
  }
}

