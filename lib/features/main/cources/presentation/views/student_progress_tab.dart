import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/features/main/cources/presentation/widgets/custom_progress_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StudentProgressTab extends StatefulWidget {
  const StudentProgressTab({super.key});

  @override
  State<StudentProgressTab> createState() => _StudentProgressTabState();
}

class _StudentProgressTabState extends State<StudentProgressTab> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('', 40, ColorManager.primary700),
      _ChartData('21 - 30 سبتمبر', 25, ColorManager.secondary300),
      _ChartData('11 - 20 سبتمبر', 45, ColorManager.primary700),
      _ChartData('1-10 سبتمبر', 30, ColorManager.secondary300),
    ];
     _tooltip = TooltipBehavior(enable: true);
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
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: ColorManager.primary100),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: SfCartesianChart(
                  borderColor: ColorManager.black500,
                  primaryXAxis: const CategoryAxis(),
                  primaryYAxis:
                      const NumericAxis(minimum: 20, maximum: 60, interval: 20),
                  tooltipBehavior: _tooltip,
                  series: <CartesianSeries<_ChartData, String>>[
                    ColumnSeries<_ChartData, String>(
                        width: .6,
                        animationDuration: 2500,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8)),
                        dataSource: data,
                        pointColorMapper: (_ChartData data,_) => data.color,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        name: '',
                        )
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color? color;
}
