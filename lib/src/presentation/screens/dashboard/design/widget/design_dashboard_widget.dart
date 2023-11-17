import 'dart:math';

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/dashboards/circle_chart.dart';
import 'package:aim/src/domain/entities/design/design_chart.dart';
import 'package:aim/src/presentation/widgets/app_bar_widget.dart';
import 'package:aim/src/presentation/widgets/bar_chart_widget.dart';
import 'package:aim/src/presentation/widgets/bar_color_widget.dart';
import 'package:aim/src/presentation/widgets/circular_indicator.dart';
import 'package:aim/src/presentation/widgets/dashboard_card_widget.dart';
import 'package:flutter/material.dart';

class DesignDashboardWidget extends StatefulWidget {
  final DesignChart designChart;
  final CircleChart circleChart;

  const DesignDashboardWidget({
    Key? key,
    required this.designChart,
    required this.circleChart,
  }) : super(key: key);

  @override
  State<DesignDashboardWidget> createState() => _DesignDashboardWidgetState();
}

class _DesignDashboardWidgetState extends State<DesignDashboardWidget> {
  late List<BarChart> data;

  @override
  void initState() {
    super.initState();
    data = [
      BarChart([
        BarData(
            S.current.mega, widget.designChart.mega?.totalDelayLess?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.designChart.sanitary?.totalDelayLess?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.designChart.construction?.totalDelayLess?.toDouble() ?? 0.0),
      ], ColorSchema.barOrange),
      BarChart([
        BarData(
            S.current.mega, widget.designChart.mega?.totalDelayMore?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.designChart.sanitary?.totalDelayMore?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.designChart.construction?.totalDelayMore?.toDouble() ?? 0.0),
      ], ColorSchema.barRed),
    ];
  }

  @override
  void didUpdateWidget(covariant DesignDashboardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    data.clear();
    data = [
      BarChart([
        BarData(
            S.current.mega, widget.designChart.mega?.totalDelayLess?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.designChart.sanitary?.totalDelayLess?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.designChart.construction?.totalDelayLess?.toDouble() ?? 0.0),
      ], ColorSchema.barOrange),
      BarChart([
        BarData(
            S.current.mega, widget.designChart.mega?.totalDelayMore?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.designChart.sanitary?.totalDelayMore?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.designChart.construction?.totalDelayMore?.toDouble() ?? 0.0),
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
                      progressColor:
                          getTotalDelayColor(widget.circleChart.total ?? 0.0),
                      // percent:
                      // ((widget.circleChart.total ?? 0.0) / 100.0) * 10,
                      percent: ((widget.circleChart.total ?? 0.0) / 100.0) > 1
                          ? 1
                          : ((widget.circleChart.total ?? 0.0) / 100.0),
                      title: "${(widget.circleChart.total ?? 0.0)}%",
                    ),
                    const SizedBox(height: 12),
                    BarColorWidget(
                      barColors: [
                        BarColorModel(
                            title: S.of(context).totalDelayLessEqualThan,
                            color: ColorSchema.barOrange),
                        BarColorModel(
                            title: S.of(context).totalDelayMoreThan,
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
                    _sectionTitle(S.of(context).designProcessAnalysis),
                    const SizedBox(height: 22),
                    BarChartWidget(
                      maximumLabels: 3,
                      labelRotation: 0,
                      data: data,
                      width: 0.3,
                      height: 250,
                      minimum: 0,
                      maximum: getMax(widget.designChart),
                      interval: 1,
                    ),
                    BarColorWidget(
                      barColors: [
                        BarColorModel(
                            title: S.of(context).totalDelayLessEqualThan,
                            color: ColorSchema.barOrange),
                        BarColorModel(
                            title: S.of(context).totalDelayMoreThan,
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

  double getMax(DesignChart designChart) {
    double maxValue = max(
      designChart.mega?.maxValue ?? 0.0,
      max(
        designChart.sanitary?.maxValue ?? 0.0,
        designChart.construction?.maxValue ?? 0.0,
      ),
    );
    return maxValue + (maxValue * 0.1);
  }

  Color getTotalDelayColor(double total) {
    if (total <= 120.0) {
      return ColorSchema.barOrange;
    }
    {
      return Colors.red;
    }
  }
}
