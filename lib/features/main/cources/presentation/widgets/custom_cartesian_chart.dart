import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/features/main/cources/model/chart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomCartesianChart extends StatelessWidget {
  const CustomCartesianChart({
    super.key,
    required TooltipBehavior tooltip,
    required this.data,
  }) : _tooltip = tooltip;

  final TooltipBehavior _tooltip;
  final List<ChartData> data;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            series: <CartesianSeries<ChartData, String>>[
              ColumnSeries<ChartData, String>(
                width: .6,
                animationDuration: 2500,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                dataSource: data,
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                name: '',
              )
            ]),
      ),
    );
  }
}
