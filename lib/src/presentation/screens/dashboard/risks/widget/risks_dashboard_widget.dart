import 'dart:math';

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/presentation/widgets/bar_chart_widget.dart';
import 'package:aim/src/presentation/widgets/bar_color_widget.dart';
import 'package:aim/src/presentation/widgets/dashboard_card_widget.dart';
import 'package:aim/src/presentation/widgets/linear_percent_indicator_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RisksDashboardWidget extends StatefulWidget {
  final AnalysisChartByPhase analysisChartByPhase;
  final AnalysisChartBySector analysisChartBySector;
  final List<int> riskCounts;

  const RisksDashboardWidget({
    Key? key,
    required this.analysisChartBySector,
    required this.analysisChartByPhase,
    required this.riskCounts,
  }) : super(key: key);

  @override
  State<RisksDashboardWidget> createState() => _RisksDashboardWidgetState();
}

class _RisksDashboardWidgetState extends State<RisksDashboardWidget> {
  late List<BarChart> data;

  @override
  void initState() {
    super.initState();
    data = [
      BarChart([
        BarData(
            S.current.mega, widget.analysisChartBySector.mega?.low?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.analysisChartBySector.sanitary?.low?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.analysisChartBySector.construction?.low?.toDouble() ?? 0.0),
      ], ColorSchema.barGreen),
      BarChart([
        BarData(S.current.mega,
            widget.analysisChartBySector.mega?.meduim?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.analysisChartBySector.sanitary?.meduim?.toDouble() ?? 0.0),
        BarData(
            S.current.construction,
            widget.analysisChartBySector.construction?.meduim?.toDouble() ??
                0.0),
      ], ColorSchema.barOrange),
      BarChart([
        BarData(
            S.current.mega, widget.analysisChartBySector.mega?.high?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.analysisChartBySector.sanitary?.high?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.analysisChartBySector.construction?.high?.toDouble() ?? 0.0),
      ], ColorSchema.barRed),
    ];
  }

  @override
  void didUpdateWidget(covariant RisksDashboardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    data.clear();
    data = [
      BarChart([
        BarData(
            S.current.mega, widget.analysisChartBySector.mega?.low?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.analysisChartBySector.sanitary?.low?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.analysisChartBySector.construction?.low?.toDouble() ?? 0.0),
      ], ColorSchema.barGreen),
      BarChart([
        BarData(S.current.mega,
            widget.analysisChartBySector.mega?.meduim?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.analysisChartBySector.sanitary?.meduim?.toDouble() ?? 0.0),
        BarData(
            S.current.construction,
            widget.analysisChartBySector.construction?.meduim?.toDouble() ??
                0.0),
      ], ColorSchema.barOrange),
      BarChart([
        BarData(
            S.current.mega, widget.analysisChartBySector.mega?.high?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.analysisChartBySector.sanitary?.high?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.analysisChartBySector.construction?.high?.toDouble() ?? 0.0),
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
                    _sectionTitle(S.of(context).riskAnalysisPerSector),
                    const SizedBox(height: 22),
                    BarChartWidget(
                      maximumLabels: 3,
                      labelRotation: 0,
                      data: data,
                      height: 250,
                      width: 0.4,
                      minimum: 0,
                      maximum: getMax(widget.analysisChartBySector),
                      interval: 1,
                    ),
                    const SizedBox(height: 12),
                    BarColorWidget(
                      barColors: [
                        BarColorModel(
                            title: S.of(context).lowSeverity, color: ColorSchema.barGreen),
                        BarColorModel(
                            title: S.of(context).mediumSeverity, color: ColorSchema.barOrange),
                        BarColorModel(title: S.of(context).highSeverity, color: ColorSchema.barRed),
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
                    _sectionTitle(S.of(context).riskAnalysisPerPhase),
                    const SizedBox(height: 22),
                    _buildLinearIndicatorItem(
                        title: S.of(context).design,
                        percent: risksByPhasePercent(
                            widget.analysisChartByPhase.design?.low ?? 0),
                        number:
                            "${widget.analysisChartByPhase.design?.low ?? 0}"),
                    const SizedBox(height: 23),
                    _buildLinearIndicatorItem(
                      title: S.of(context).tendering,
                      percent: risksByPhasePercent(
                          widget.analysisChartByPhase.tendering?.low ?? 0),
                      number:
                          "${widget.analysisChartByPhase.tendering?.low ?? 0}",
                    ),
                    const SizedBox(height: 23),
                    _buildLinearIndicatorItem(
                      title: S.of(context).execution,
                      percent: risksByPhasePercent(
                          widget.analysisChartByPhase.execution?.low ?? 0),
                      number:
                          "${widget.analysisChartByPhase.execution?.low ?? 0}",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildCardWithImageWidget(
                  cardTitle: S.of(context).activesRisk,
                  cardCount:
                      "${widget.riskCounts.isNotEmpty ? widget.riskCounts[0] : 0}",
                  imagePath: ImagePaths.activeRisk,
                ),
                const SizedBox(
                  width: 16,
                ),
                _buildCardWithImageWidget(
                  cardTitle: S.of(context).highRisk,
                  cardCount:
                      "${widget.riskCounts.isNotEmpty ? widget.riskCounts[1] : 0}",
                  imagePath: ImagePaths.highRisk,
                )
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  double risksByPhasePercent(int value) {
    int maxNumber = max(
        max(widget.analysisChartByPhase.design?.low ?? 0,
            widget.analysisChartByPhase.tendering?.low ?? 0),
        widget.analysisChartByPhase.execution?.low ?? 0);
    if (maxNumber == 0) {
      return 0.0;
    } else {
      return value / maxNumber;
    }
  }

  LinearPercentIndicatorItem _buildLinearIndicatorItem({
    required String title,
    required double percent,
    required String number,
  }) {
    return LinearPercentIndicatorItem(
      text: title,
      percent: percent,
      number: number,
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

  _buildCardWithImageWidget({
    required String cardTitle,
    required String cardCount,
    required String imagePath,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                spreadRadius: 0,
                blurRadius: 16,
                color: ColorSchema.black.withOpacity(0.1))
          ],
          color: ColorSchema.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorSchema.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  width: 42,
                  height: 42,
                  child: Center(
                    child: SvgPicture.asset(
                      imagePath,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  cardCount,
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        letterSpacing: -0.36,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              cardTitle,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    letterSpacing: -0.26,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  double getMax(AnalysisChartBySector analysisChartBySector) {
    double maxValue =  max(
      analysisChartBySector.mega?.maxValue ?? 0.0,
      max(
        analysisChartBySector.sanitary?.maxValue ?? 0.0,
        analysisChartBySector.construction?.maxValue ?? 0.0,
      ),
    );
    return maxValue + (maxValue * 0.1);
  }
}
