import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/cources/model/chart_model.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/custom_cartesian_chart.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/custom_progress_row.dart';
import 'package:flutter/material.dart';

class StudentProgressTab extends StatefulWidget {
  const StudentProgressTab({super.key});

  @override
  State<StudentProgressTab> createState() => _StudentProgressTabState();
}

class _StudentProgressTabState extends State<StudentProgressTab> {
  late List<ChartData> data;
  // late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      ChartData('', 40, ColorManager.primary700),
      ChartData('21 - 30 سبتمبر', 25, ColorManager.secondary300),
      ChartData('11 - 20 سبتمبر', 45, ColorManager.primary700),
      ChartData('1-10 سبتمبر', 30, ColorManager.secondary300),
    ];
    // _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomProgressRow(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Text(
            "تابع تقدم طفلك",
            style: getMediumStyle(
              color: ColorManager.black500,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text('No data')
            // CustomCartesianChart(tooltip: _tooltip, data: data),
            ),
      ],
    );
  }
}
