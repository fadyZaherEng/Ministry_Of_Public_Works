import 'dart:math';

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/package/package_analysis_chart.dart';
import 'package:aim/src/domain/entities/package/package_circle_chart.dart';
import 'package:aim/src/presentation/widgets/app_bar_widget.dart';
import 'package:aim/src/presentation/widgets/bar_chart_widget.dart';
import 'package:aim/src/presentation/widgets/bar_color_widget.dart';
import 'package:aim/src/presentation/widgets/circular_indicator.dart';
import 'package:aim/src/presentation/widgets/dashboard_card_widget.dart';
import 'package:flutter/material.dart';

class PackageDashboardWidget extends StatefulWidget {
  final PackageAnalysisChart packageAnalysisChart;
  final PackageCircleChart packageCircleChart;

  const PackageDashboardWidget({
    Key? key,
    required this.packageCircleChart,
    required this.packageAnalysisChart,
  }) : super(key: key);

  @override
  State<PackageDashboardWidget> createState() => _PackageDashboardWidgetState();
}

class _PackageDashboardWidgetState extends State<PackageDashboardWidget> {
  late List<BarChart> data;

  @override
  void initState() {
    super.initState();
    data = [
      BarChart([
        BarData(S.current.mega,
            widget.packageAnalysisChart.mega?.totalNoLess?.toDouble() ?? 0.0),
        BarData(
            S.current.sanitary,
            widget.packageAnalysisChart.sanitary?.totalNoLess?.toDouble() ??
                0.0),
        BarData(
            S.current.construction,
            widget.packageAnalysisChart.construction?.totalNoLess?.toDouble() ??
                0.0),
      ], ColorSchema.barGreen),
      BarChart([
        BarData(
            S.current.mega,
            widget.packageAnalysisChart.mega?.totalNoBetween?.toDouble() ??
                0.0),
        BarData(
            S.current.sanitary,
            widget.packageAnalysisChart.sanitary?.totalNoBetween?.toDouble() ??
                0.0),
        BarData(
            S.current.construction,
            widget.packageAnalysisChart.construction?.totalNoBetween
                    ?.toDouble() ??
                0.0),
      ], ColorSchema.barOrange),
      BarChart([
        BarData(S.current.mega,
            widget.packageAnalysisChart.mega?.totalNoMore?.toDouble() ?? 0.0),
        BarData(
            S.current.sanitary,
            widget.packageAnalysisChart.sanitary?.totalNoMore?.toDouble() ??
                0.0),
        BarData(
            S.current.construction,
            widget.packageAnalysisChart.construction?.totalNoMore?.toDouble() ??
                0.0),
      ], ColorSchema.barRed),
    ];
  }

  @override
  void didUpdateWidget(covariant PackageDashboardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    data.clear();
    data = [
      BarChart([
        BarData(S.current.mega,
            widget.packageAnalysisChart.mega?.totalNoLess?.toDouble() ?? 0.0),
        BarData(
            S.current.sanitary,
            widget.packageAnalysisChart.sanitary?.totalNoLess?.toDouble() ??
                0.0),
        BarData(
            S.current.construction,
            widget.packageAnalysisChart.construction?.totalNoLess?.toDouble() ??
                0.0),
      ], ColorSchema.barGreen),
      BarChart([
        BarData(
            S.current.mega,
            widget.packageAnalysisChart.mega?.totalNoBetween?.toDouble() ??
                0.0),
        BarData(
            S.current.sanitary,
            widget.packageAnalysisChart.sanitary?.totalNoBetween?.toDouble() ??
                0.0),
        BarData(
            S.current.construction,
            widget.packageAnalysisChart.construction?.totalNoBetween
                ?.toDouble() ??
                0.0),
      ], ColorSchema.barOrange),
      BarChart([
        BarData(S.current.mega,
            widget.packageAnalysisChart.mega?.totalNoMore?.toDouble() ?? 0.0),
        BarData(
            S.current.sanitary,
            widget.packageAnalysisChart.sanitary?.totalNoMore?.toDouble() ??
                0.0),
        BarData(
            S.current.construction,
            widget.packageAnalysisChart.construction?.totalNoMore?.toDouble() ??
                0.0),
      ], ColorSchema.barRed),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DashboardCardWidget(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _sectionTitle(S.of(context).ministryEvaluationAnalysis),
                    const SizedBox(height: 22),
                    buildCircularIndicator(
                      radius: 50,
                      lineWidth: 10,
                      progressColor: getMinistryEvaluationColor(widget.packageCircleChart.total ?? 0.0),
                      percent: ((widget.packageCircleChart.total ?? 0.0) / 100) > 1 ? 1 : ((widget.packageCircleChart.total ?? 0.0) / 100),
                      title:
                          "${widget.packageCircleChart.total ?? 0.0}%",
                    ),
                    const SizedBox(height: 12),
                    BarColorWidget(
                      barColors: [
                        BarColorModel(
                            title: S.of(context).totalNOGreen, color: ColorSchema.barGreen),
                        BarColorModel(
                            title: S.of(context).totalNOOrange, color: ColorSchema.barOrange),
                        BarColorModel(title: S.of(context).totalNORed, color: ColorSchema.barRed),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 22),
            DashboardCardWidget(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle(S.of(context).finalDataPackageAnalysis),
                    const SizedBox(height: 22),
                    BarChartWidget(
                      maximumLabels: 3,
                      labelRotation: 0,
                      data: data,
                      height: 250,
                      minimum: 0,
                      maximum: getMax(widget.packageAnalysisChart),
                      interval: 1,
                    ),
                    BarColorWidget(
                      barColors: [
                        BarColorModel(
                            title: S.of(context).totalNOGreen, color: ColorSchema.barGreen),
                        BarColorModel(
                            title: S.of(context).totalNOOrange, color: ColorSchema.barOrange),
                        BarColorModel(title: S.of(context).totalNORed, color: ColorSchema.barRed),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  CircularIndicator buildCircularIndicator({
    required double radius,
    required double lineWidth,
    required Color progressColor,
    required double percent,
    required String title,
  }) {
    return CircularIndicator(
      radius: radius,
      lineWidth: lineWidth,
      backGroundColor: ColorSchema.circularInActive,
      progressColor: progressColor,
      percent: 0.4,
      title: title,
    );
  }

  Text _sectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline3?.copyWith(
            letterSpacing: -0.32,
            fontWeight: semiBold,
          ),
    );
  }

  double getMax(PackageAnalysisChart packageAnalysisChart) {
    double maxValue =  max(
      packageAnalysisChart.mega?.maxValue ?? 0.0,
      max(
        packageAnalysisChart.sanitary?.maxValue ?? 0.0,
        packageAnalysisChart.construction?.maxValue ?? 0.0,
      ),
    );
    return maxValue + (maxValue * 0.1);
  }

  Color getMinistryEvaluationColor(double total){
    if(total <= 40.0) {
      return ColorSchema.barGreen;
    } else if(total > 40.0 && total < 60.0) {
      return Colors.yellow;
    } else if(total >= 60.0) {
      return ColorSchema.barRed  ;
    } else {
      return ColorSchema.barGreen;
    }
  }
}
