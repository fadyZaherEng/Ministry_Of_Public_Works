import 'dart:math';

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/domain/entities/dashboards/circle_chart.dart';
import 'package:aim/src/domain/entities/dashboards/variations_chart.dart';
import 'package:aim/src/presentation/widgets/bar_chart_widget.dart';
import 'package:aim/src/presentation/widgets/circular_indicator.dart';
import 'package:aim/src/presentation/widgets/bar_color_widget.dart';
import 'package:aim/src/presentation/widgets/dashboard_card_widget.dart';
import 'package:flutter/material.dart';

class VariationsDashboardWidget extends StatefulWidget {
  final VariationsChart variationsChart;
  final CircleChart circleChart;

  const VariationsDashboardWidget({
    Key? key,
    required this.variationsChart,
    required this.circleChart,
  }) : super(key: key);

  @override
  State<VariationsDashboardWidget> createState() =>
      _VariationsDashboardWidgetState();
}

class _VariationsDashboardWidgetState extends State<VariationsDashboardWidget> {
  late List<BarChart> data;
  double total = 0.0;

  @override
  void initState() {
    super.initState();
    data = [
      BarChart([
        BarData(S.current.mega,
            widget.variationsChart.mega?.lessThan?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.variationsChart.sanitary?.lessThan?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.variationsChart.construction?.lessThan?.toDouble() ?? 0.0),
      ], ColorSchema.barGreen),
      BarChart([
        BarData(S.current.mega,
            widget.variationsChart.mega?.between?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.variationsChart.sanitary?.between?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.variationsChart.construction?.between?.toDouble() ?? 0.0),
      ], ColorSchema.barOrange),
      BarChart([
        BarData(S.current.mega,
            widget.variationsChart.mega?.moreThan?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.variationsChart.sanitary?.moreThan?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.variationsChart.construction?.moreThan?.toDouble() ?? 0.0),
      ], ColorSchema.barRed),
    ];
  }

  @override
  void didUpdateWidget(covariant VariationsDashboardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    data.clear();
    data = [
      BarChart([
        BarData(S.current.mega,
            widget.variationsChart.mega?.lessThan?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.variationsChart.sanitary?.lessThan?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.variationsChart.construction?.lessThan?.toDouble() ?? 0.0),
      ], ColorSchema.barGreen),
      BarChart([
        BarData(S.current.mega,
            widget.variationsChart.mega?.between?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.variationsChart.sanitary?.between?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.variationsChart.construction?.between?.toDouble() ?? 0.0),
      ], ColorSchema.barOrange),
      BarChart([
        BarData(S.current.mega,
            widget.variationsChart.mega?.moreThan?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.variationsChart.sanitary?.moreThan?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.variationsChart.construction?.moreThan?.toDouble() ?? 0.0),
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
                      progressColor: getMinistryEvaluationColor(
                          widget.circleChart.total ?? 0.0),
                      percent: ((widget.circleChart.total?.abs() ?? 0.0) /
                                  100.0) >
                              1.0
                          ? 1
                          : ((widget.circleChart.total?.abs() ?? 0.0) / 100.0),
                      title: "${widget.circleChart.total?.abs() ?? 0.0}%",
                    ),
                    const SizedBox(height: 12),
                    BarColorWidget(
                      barColors: [
                        BarColorModel(
                            title: S.of(context).variationOrderGreen,
                            color: ColorSchema.barGreen),
                        BarColorModel(
                            title: S.of(context).variationOrderOrange,
                            color: ColorSchema.barOrange),
                        BarColorModel(
                            title: S.of(context).variationOrderRed,
                            color: ColorSchema.barRed),
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
                    _sectionTitle(S.of(context).variationOrderAnalysis),
                    const SizedBox(height: 22),
                    BarChartWidget(
                      maximumLabels: 3,
                      labelRotation: 0,
                      data: data,
                      height: 250,
                      width: 0.4,
                      minimum: 0,
                      maximum: getMax(widget.variationsChart),
                      interval: 1,
                    ),
                    const SizedBox(height: 12),
                    BarColorWidget(
                      barColors: [
                        BarColorModel(
                            title: S.of(context).variationOrderGreen,
                            color: ColorSchema.barGreen),
                        BarColorModel(
                            title: S.of(context).variationOrderOrange,
                            color: ColorSchema.barOrange),
                        BarColorModel(
                            title: S.of(context).variationOrderRed,
                            color: ColorSchema.barRed),
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
      percent: percent,
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

  double getMax(VariationsChart variationsChart) {
    double maxValue = max(
      variationsChart.mega?.maxValue ?? 0.0,
      max(
        variationsChart.sanitary?.maxValue ?? 0.0,
        variationsChart.construction?.maxValue ?? 0.0,
      ),
    );
    return maxValue + (maxValue * 0.1);
  }

  Color getMinistryEvaluationColor(double total) {
    if (total <= 5.0) {
      return ColorSchema.barGreen;
    } else if (total > 5.0 && total < 10.0) {
      return Colors.yellow;
    } else if (total >= 10.0) {
      return ColorSchema.barRed;
    } else {
      return ColorSchema.barGreen;
    }
  }
}
