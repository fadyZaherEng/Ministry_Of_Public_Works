import 'dart:math';

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/domain/entities/dashboards/penalties_chart.dart';
import 'package:aim/src/presentation/widgets/bar_chart_widget.dart';
import 'package:aim/src/presentation/widgets/bar_color_widget.dart';
import 'package:aim/src/presentation/widgets/dashboard_card_widget.dart';
import 'package:flutter/material.dart';

class PenaltiesDashboardWidget extends StatefulWidget {
  final PenaltiesChart penaltiesChartDesign;
  final PenaltiesChart penaltiesChartExecution;

  const PenaltiesDashboardWidget({
    Key? key,
    required this.penaltiesChartDesign,
    required this.penaltiesChartExecution,
  }) : super(key: key);

  @override
  State<PenaltiesDashboardWidget> createState() =>
      _PenaltiesDashboardWidgetState();
}

class _PenaltiesDashboardWidgetState extends State<PenaltiesDashboardWidget> {
  late List<BarChart> data;
  late List<BarChart> dataTwo;

  @override
  void initState() {
    super.initState();
    data = [
      BarChart(
        [
          BarData(S.current.mega, widget.penaltiesChartDesign.mega?.noPenalty?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.penaltiesChartDesign.sanitary?.noPenalty?.toDouble() ?? 0.0),
          BarData(S.current.construction,
              widget.penaltiesChartDesign.construction?.noPenalty?.toDouble() ?? 0.0),
        ],
        ColorSchema.barGreen,
      ),
      BarChart(
        [
          BarData(S.current.mega, widget.penaltiesChartDesign.mega?.lessThanTen?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.penaltiesChartDesign.sanitary?.lessThanTen?.toDouble() ?? 0.0),
          BarData(S.current.construction,
              widget.penaltiesChartDesign.construction?.lessThanTen?.toDouble() ?? 0.0),
        ],
        ColorSchema.barOrange,
      ),
      BarChart(
        [
          BarData(S.current.mega, widget.penaltiesChartDesign.mega?.moreThanTen?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.penaltiesChartDesign.sanitary?.moreThanTen?.toDouble() ?? 0.0),
          BarData(S.current.construction,
              widget.penaltiesChartDesign.construction?.moreThanTen?.toDouble() ?? 0.0),
        ],
        ColorSchema.barRed,
      ),
    ];
    dataTwo = [
      BarChart(
        [
          BarData(S.current.mega, widget.penaltiesChartExecution.mega?.noPenalty?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.penaltiesChartExecution.sanitary?.noPenalty?.toDouble() ?? 0.0),
          BarData(S.current.construction,
              widget.penaltiesChartExecution.construction?.noPenalty?.toDouble() ?? 0.0),
        ],
        ColorSchema.barGreen,
      ),
      BarChart(
        [
          BarData(S.current.mega, widget.penaltiesChartExecution.mega?.lessThanTen?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.penaltiesChartExecution.sanitary?.lessThanTen?.toDouble() ?? 0.0),
          BarData(S.current.construction,
              widget.penaltiesChartExecution.construction?.lessThanTen?.toDouble() ?? 0.0),
        ],
        ColorSchema.barOrange,
      ),
      BarChart(
        [
          BarData(S.current.mega, widget.penaltiesChartExecution.mega?.moreThanTen?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.penaltiesChartExecution.sanitary?.moreThanTen?.toDouble() ?? 0.0),
          BarData(S.current.construction,
              widget.penaltiesChartExecution.construction?.moreThanTen?.toDouble() ?? 0.0),
        ],
        ColorSchema.barRed,
      ),
    ];
  }

  @override
  void didUpdateWidget(covariant PenaltiesDashboardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    data.clear();
    dataTwo.clear();
    data = [
      BarChart(
        [
          BarData(S.current.mega, widget.penaltiesChartDesign.mega?.noPenalty?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.penaltiesChartDesign.sanitary?.noPenalty?.toDouble() ?? 0.0),
          BarData(S.current.construction,
              widget.penaltiesChartDesign.construction?.noPenalty?.toDouble() ?? 0.0),
        ],
        ColorSchema.barGreen,
      ),
      BarChart(
        [
          BarData(S.current.mega, widget.penaltiesChartDesign.mega?.lessThanTen?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.penaltiesChartDesign.sanitary?.lessThanTen?.toDouble() ?? 0.0),
          BarData(S.current.construction,
              widget.penaltiesChartDesign.construction?.lessThanTen?.toDouble() ?? 0.0),
        ],
        ColorSchema.barOrange,
      ),
      BarChart(
        [
          BarData(S.current.mega, widget.penaltiesChartDesign.mega?.moreThanTen?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.penaltiesChartDesign.sanitary?.moreThanTen?.toDouble() ?? 0.0),
          BarData(S.current.construction,
              widget.penaltiesChartDesign.construction?.moreThanTen?.toDouble() ?? 0.0),
        ],
        ColorSchema.barRed,
      ),
    ];
    dataTwo = [
      BarChart(
        [
          BarData(S.current.mega, widget.penaltiesChartExecution.mega?.noPenalty?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.penaltiesChartExecution.sanitary?.noPenalty?.toDouble() ?? 0.0),
          BarData(S.current.construction,
              widget.penaltiesChartExecution.construction?.noPenalty?.toDouble() ?? 0.0),
        ],
        ColorSchema.barGreen,
      ),
      BarChart(
        [
          BarData(S.current.mega, widget.penaltiesChartExecution.mega?.lessThanTen?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.penaltiesChartExecution.sanitary?.lessThanTen?.toDouble() ?? 0.0),
          BarData(S.current.construction,
              widget.penaltiesChartExecution.construction?.lessThanTen?.toDouble() ?? 0.0),
        ],
        ColorSchema.barOrange,
      ),
      BarChart(
        [
          BarData(S.current.mega, widget.penaltiesChartExecution.mega?.moreThanTen?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.penaltiesChartExecution.sanitary?.moreThanTen?.toDouble() ?? 0.0),
          BarData(S.current.construction,
              widget.penaltiesChartExecution.construction?.moreThanTen?.toDouble() ?? 0.0),
        ],
        ColorSchema.barRed,
      ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle(S.of(context).penaltiesAnalysisForDesign),
                    const SizedBox(height: 22),
                    BarChartWidget(
                      maximumLabels: 3,
                      labelRotation: 0,
                      data: data,
                      height: 250,
                      width: 0.4,
                      minimum: 0,
                      maximum: getMax(widget.penaltiesChartDesign),
                      interval: 1,
                    ),
                    BarColorWidget(
                      barColors: [
                        BarColorModel(
                            title: S.of(context).noPenalties, color: ColorSchema.barGreen),
                        BarColorModel(
                            title: S.of(context).totalPenaltiesLessThanTen, color: ColorSchema.barOrange),
                        BarColorModel(title: S.of(context).totalPenaltiesGreaterOrEqualTen, color: ColorSchema.barRed),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            DashboardCardWidget(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle(S.of(context).penaltiesAnalysisForExecution),
                    const SizedBox(height: 22),
                    BarChartWidget(
                      maximumLabels: 3,
                      labelRotation: 0,
                      data: dataTwo,
                      width: 0.4,
                      height: 250,
                      minimum: 0,
                      maximum: getMax(widget.penaltiesChartExecution),
                      interval: 1,
                    ),
                    const SizedBox(height: 12),
                    BarColorWidget(
                      barColors: [
                        BarColorModel(
                            title: S.of(context).noPenalties, color: ColorSchema.barGreen),
                        BarColorModel(
                            title: S.of(context).totalPenaltiesLessThanTwenty, color: ColorSchema.barOrange),
                        BarColorModel(title: S.of(context).totalPenaltiesGreaterOrEqualTwenty, color: ColorSchema.barRed),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
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

  double getMax(PenaltiesChart penaltiesChart) {
    double maxValue =  max(
      penaltiesChart.mega?.maxValue ?? 0.0,
      max(
        penaltiesChart.sanitary?.maxValue ?? 0.0,
        penaltiesChart.construction?.maxValue ?? 0.0,
      ),
    );
    return maxValue + (maxValue * 0.1);
  }
}
