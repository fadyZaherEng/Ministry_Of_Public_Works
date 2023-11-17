import 'dart:math';

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/domain/entities/contract/approved_analysis.dart';
import 'package:aim/src/domain/entities/contract/delay_analysis.dart';
import 'package:aim/src/domain/entities/contract/operation_analysis.dart';
import 'package:aim/src/presentation/widgets/bar_chart_widget.dart';
import 'package:aim/src/presentation/widgets/bar_color_widget.dart';
import 'package:aim/src/presentation/widgets/circular_indicator.dart';
import 'package:aim/src/presentation/widgets/dashboard_card_widget.dart';
import 'package:flutter/material.dart';

class ContractsDashboardWidget extends StatefulWidget {
  final ApprovedAnalysis approvedAnalysis;
  final DelayAnalysis delayAnalysis;
  final OperationAnalysis operationAnalysis;

  const ContractsDashboardWidget({
    Key? key,
    required this.approvedAnalysis,
    required this.delayAnalysis,
    required this.operationAnalysis,
  }) : super(key: key);

  @override
  State<ContractsDashboardWidget> createState() =>
      _ContractsDashboardWidgetState();
}

class _ContractsDashboardWidgetState extends State<ContractsDashboardWidget> {
  late List<BarChart> data;
  late List<BarChart> dataTwo;

  @override
  void initState() {
    super.initState();
    data = [
      BarChart([
        BarData(S.current.mega,
            widget.delayAnalysis.mega?.ALessThan?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.delayAnalysis.sanitary?.ALessThan?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.delayAnalysis.construction?.ALessThan?.toDouble() ?? 0.0),
      ], ColorSchema.barGreen),
      BarChart([
        BarData(S.current.mega,
            widget.delayAnalysis.mega?.BBetween?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.delayAnalysis.sanitary?.BBetween?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.delayAnalysis.construction?.BBetween?.toDouble() ?? 0.0),
      ], ColorSchema.barOrange),
      BarChart([
        BarData(S.current.mega,
            widget.delayAnalysis.mega?.CMoreThan?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.delayAnalysis.sanitary?.CMoreThan?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.delayAnalysis.construction?.CMoreThan?.toDouble() ?? 0.0),
      ], ColorSchema.barRed),
    ];
    dataTwo = [
      BarChart([
        BarData(S.current.mega,
            widget.approvedAnalysis.mega?.approved?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.approvedAnalysis.sanitary?.approved?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.approvedAnalysis.construction?.approved?.toDouble() ?? 0.0),
      ], ColorSchema.barGreen),
      BarChart([
        BarData(S.current.mega,
            widget.approvedAnalysis.mega?.notApproved?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.approvedAnalysis.sanitary?.notApproved?.toDouble() ?? 0.0),
        BarData(
            S.current.construction,
            widget.approvedAnalysis.construction?.notApproved?.toDouble() ??
                0.0),
      ], ColorSchema.barRed),
    ];
  }

  @override
  void didUpdateWidget(covariant ContractsDashboardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    data.clear();
    dataTwo.clear();
    data = [
      BarChart([
        BarData(S.current.mega,
            widget.delayAnalysis.mega?.ALessThan?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.delayAnalysis.sanitary?.ALessThan?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.delayAnalysis.construction?.ALessThan?.toDouble() ?? 0.0),
      ], ColorSchema.barGreen),
      BarChart([
        BarData(S.current.mega,
            widget.delayAnalysis.mega?.BBetween?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.delayAnalysis.sanitary?.BBetween?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.delayAnalysis.construction?.BBetween?.toDouble() ?? 0.0),
      ], ColorSchema.barOrange),
      BarChart([
        BarData(S.current.mega,
            widget.delayAnalysis.mega?.CMoreThan?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.delayAnalysis.sanitary?.CMoreThan?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.delayAnalysis.construction?.CMoreThan?.toDouble() ?? 0.0),
      ], ColorSchema.barRed),
    ];
    dataTwo = [
      BarChart([
        BarData(S.current.mega,
            widget.approvedAnalysis.mega?.approved?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.approvedAnalysis.sanitary?.approved?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.approvedAnalysis.construction?.approved?.toDouble() ?? 0.0),
      ], ColorSchema.barGreen),
      BarChart([
        BarData(S.current.mega,
            widget.approvedAnalysis.mega?.notApproved?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.approvedAnalysis.sanitary?.notApproved?.toDouble() ?? 0.0),
        BarData(
            S.current.construction,
            widget.approvedAnalysis.construction?.notApproved?.toDouble() ??
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle(S.of(context).projectsCompletionAnalysis),
                    const SizedBox(height: 22),
                    BarChartWidget(
                      maximumLabels: 3,
                      labelRotation: 0,
                      data: data,
                      height: 250,
                      minimum: 0,
                      maximum: getDelayMax(widget.delayAnalysis),
                      interval: 1,
                    ),
                    const SizedBox(height: 12),
                    BarColorWidget(
                      barColors: [
                        BarColorModel(
                            title: S.of(context).greenDelay,
                            color: ColorSchema.barGreen),
                        BarColorModel(
                            title: S.of(context).orangeDelay,
                            color: ColorSchema.barOrange),
                        BarColorModel(
                            title: S.of(context).redDelay,
                            color: ColorSchema.barRed),
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
                    _sectionTitle(S.of(context).scheduleApprovedAnalysis),
                    const SizedBox(height: 22),
                    BarChartWidget(
                      maximumLabels: 3,
                      labelRotation: 0,
                      data: dataTwo,
                      height: 250,
                      width: 0.3,
                      minimum: 0,
                      maximum: getMax(widget.approvedAnalysis),
                      interval: 1,
                    ),
                    BarColorWidget(
                      barColors: [
                        BarColorModel(
                            title: S.of(context).approved,
                            color: ColorSchema.barGreen),
                        BarColorModel(
                            title: S.of(context).unApproved,
                            color: ColorSchema.barRed),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _sectionTitle(S.of(context).variancePercentage),
                    const SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildCircularIndicator(
                          radius: 50,
                          lineWidth: 10,
                          progressColor: ColorSchema.barGreen,
                          percent: 1.0,
                          title:
                              "${widget.operationAnalysis.sanitary?.ALessThan ?? 0.0}",
                        ),
                        buildCircularIndicator(
                          radius: 50,
                          lineWidth: 10,
                          progressColor: ColorSchema.barOrange,
                          percent: 1.0,
                          title:
                              "${widget.operationAnalysis.sanitary?.BBetween ?? 0.0}",
                        ),
                        buildCircularIndicator(
                          radius: 50,
                          lineWidth: 10,
                          progressColor: ColorSchema.barRed,
                          percent: 1.0,
                          title:
                              "${widget.operationAnalysis.sanitary?.CMoreThan ?? 0.0}",
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    BarColorWidget(
                      barColors: [
                        BarColorModel(
                            title: S.of(context).greenElapsedExchange,
                            color: ColorSchema.barGreen),
                        BarColorModel(
                            title: S.of(context).orangeElapsedExchange,
                            color: ColorSchema.barOrange),
                        BarColorModel(
                            title: S.of(context).redElapsedExchange,
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
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
            letterSpacing: -0.32,
            fontWeight: semiBold,
          ),
    );
  }

  double getMax(ApprovedAnalysis approvedAnalysis) {
    double maxValue = max(
      approvedAnalysis.mega?.maxValue ?? 0.0,
      max(
        approvedAnalysis.sanitary?.maxValue ?? 0.0,
        approvedAnalysis.construction?.maxValue ?? 0.0,
      ),
    );
    return maxValue + (maxValue * 0.1);
  }

  double getDelayMax(DelayAnalysis delayAnalysis) {
    double maxValue = max(
      delayAnalysis.mega?.maxValue ?? 0.0,
      max(
        delayAnalysis.sanitary?.maxValue ?? 0.0,
        delayAnalysis.construction?.maxValue ?? 0.0,
      ),
    );
    return maxValue + (maxValue * 0.1);
  }

  Color getOperationColor(OperationAnalysis operationAnalysis) {
    if ((operationAnalysis.sanitary?.ALessThan ?? 0.0) > 0) {
      return ColorSchema.barGreen;
    } else if ((operationAnalysis.sanitary?.BBetween ?? 0.0) > 0) {
      return ColorSchema.barOrange;
    } else {
      return ColorSchema.barRed;
    }
  }
}
