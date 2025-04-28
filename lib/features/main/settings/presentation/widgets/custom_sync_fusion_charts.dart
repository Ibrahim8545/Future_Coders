import 'package:courseapp/core/utils/color_manager.dart';
import 'package:courseapp/core/utils/styles_manager.dart';
import 'package:courseapp/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomSyncFusionCharts extends StatelessWidget {
  const CustomSyncFusionCharts({
    super.key,
    required TooltipBehavior tooltipBehavior,
  }) : _tooltipBehavior = tooltipBehavior;

  final TooltipBehavior _tooltipBehavior;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.s8),
        color: ColorManager.blue50,
      ),
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        title: ChartTitle(
            alignment: ChartAlignment.far,
            text: 'النشاط الاسبوعي',
            textStyle: getSemiBoldStyle(
              color: ColorManager.black500,
            )),
        legend: const Legend(isVisible: false),
        tooltipBehavior: _tooltipBehavior,
        series: <LineSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              dataSource: <SalesData>[
                SalesData(' جمع', 22),
                SalesData(' خمي', 15),
                SalesData('اربع', 35),
                SalesData('ثلا', 28),
                SalesData('اثن', 34),
                SalesData('احد', 32),
                SalesData('سبت', 40)
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              // Enable data label
              dataLabelSettings: const DataLabelSettings(isVisible: true))
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
