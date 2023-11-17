// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_phase.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_sector.dart';
import 'package:aim/src/presentation/widgets/bar_chart_widget.dart';
import 'package:aim/src/presentation/widgets/dashboard_card_widget.dart';
import 'package:aim/src/presentation/widgets/image_with_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OverviewDashboardWidget extends StatefulWidget {
  final OverviewChartByPhase overviewChartByPhase;
  final OverviewChartBySector overviewChartBySector;
  final List<String> cards;
  final int projects;

  const OverviewDashboardWidget({
    Key? key,
    required this.overviewChartByPhase,
    required this.overviewChartBySector,
    required this.cards,
    required this.projects,
  }) : super(key: key);

  @override
  State<OverviewDashboardWidget> createState() =>
      _OverviewDashboardWidgetState();
}

class _OverviewDashboardWidgetState extends State<OverviewDashboardWidget> {
  late List<BarChart> data;
  late List<BarChart> dataTwo;

  @override
  void initState() {
    super.initState();
    data = [
      BarChart(
        [
          BarData(S.current.mega,
              widget.overviewChartBySector.mega?.low?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.overviewChartBySector.sanitary?.low?.toDouble() ?? 0.0),
          BarData(
              S.current.construction,
              widget.overviewChartBySector.construction?.low?.toDouble() ??
                  0.0),
        ],
        ColorSchema.primary,
      ),
    ];
    dataTwo = [
      BarChart(
        [
          BarData(S.current.design,
              widget.overviewChartByPhase.design?.low?.toDouble() ?? 0.0),
          BarData(S.current.tendering,
              widget.overviewChartByPhase.tendering?.low?.toDouble() ?? 0.0),
          BarData(S.current.execution,
              widget.overviewChartByPhase.execution?.low?.toDouble() ?? 0.0),
        ],
        ColorSchema.barOrange,
      ),
    ];
  }

  @override
  void didUpdateWidget(covariant OverviewDashboardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    data.clear();
    dataTwo.clear();
    data = [
      BarChart(
        [
          BarData(S.current.mega,
              widget.overviewChartBySector.mega?.low?.toDouble() ?? 0.0),
          BarData(S.current.sanitary,
              widget.overviewChartBySector.sanitary?.low?.toDouble() ?? 0.0),
          BarData(
              S.current.construction,
              widget.overviewChartBySector.construction?.low?.toDouble() ??
                  0.0),
        ],
        ColorSchema.primary,
      ),
    ];

    dataTwo = [
      BarChart(
        [
          BarData(S.current.design,
              widget.overviewChartByPhase.design?.low?.toDouble() ?? 0.0),
          BarData(S.current.tendering,
              widget.overviewChartByPhase.tendering?.low?.toDouble() ?? 0.0),
          BarData(S.current.execution,
              widget.overviewChartByPhase.execution?.low?.toDouble() ?? 0.0),
        ],
        ColorSchema.barOrange,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 165,
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorSchema.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          spreadRadius: 0,
                          blurRadius: 24,
                          color: ColorSchema.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Wrap(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImagePaths.numberOfProject,
                                width: 42,
                                height: 42,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                widget.cards[0],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                      letterSpacing: -0.36,
                                      fontSize: 14,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                S.of(context).numberOfProjects,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      letterSpacing: -0.26,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 165,
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorSchema.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          spreadRadius: 0,
                          blurRadius: 24,
                          color: ColorSchema.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Wrap(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImagePaths.overviewContractAmount,
                                width: 42,
                                height: 42,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                widget.cards[1],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                      letterSpacing: -0.36,
                                      fontSize: 14,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                S.of(context).contractsAmount,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      letterSpacing: -0.26,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 165,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorSchema.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          spreadRadius: 0,
                          blurRadius: 24,
                          color: ColorSchema.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Wrap(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ImagePaths.physicalPayment,
                                width: 42,
                                height: 42,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                widget.cards[2],
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                      fontSize: 14,
                                      letterSpacing: -0.36,
                                    ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                S.of(context).totalPaymentsPerFiscalYear,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                      letterSpacing: -0.26,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            DashboardCardWidget(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle(S.of(context).numberOfProjectsBySector),
                    const SizedBox(height: 22),
                    BarChartWidget(
                      maximumLabels: 3,
                      labelRotation: 0,
                      data: data,
                      width: 0.15,
                      height: 250,
                      minimum: 0,
                      maximum: getMaxSector(widget.overviewChartBySector),
                      interval: 1,
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
                    _sectionTitle(S.of(context).numberOfProjectsByPhase),
                    const SizedBox(height: 22),
                    BarChartWidget(
                      maximumLabels: 3,
                      labelRotation: 0,
                      data: dataTwo,
                      height: 250,
                      width: 0.15,
                      minimum: 0,
                      maximum: getMaxPhase(widget.overviewChartByPhase),
                      interval: 1,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ImageWithTitleWidget(
              padding: const EdgeInsets.all(16),
              image: ImagePaths.risks,
              title: S.of(context).workInProgress,
              value: "${widget.projects}",
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

  double getMaxPhase(OverviewChartByPhase overviewChartByPhase) {
    double maxValue = max(
      overviewChartByPhase.execution?.maxValue ?? 0.0,
      max(
        overviewChartByPhase.tendering?.maxValue ?? 0.0,
        overviewChartByPhase.design?.maxValue ?? 0.0,
      ),
    );
    return maxValue + (maxValue * 0.1);
  }

  double getMaxSector(OverviewChartBySector overviewChartBySector) {
    double maxValue = max(
      overviewChartBySector.mega?.maxValue ?? 0.0,
      max(
        overviewChartBySector.sanitary?.maxValue ?? 0.0,
        overviewChartBySector.construction?.maxValue ?? 0.0,
      ),
    );
    return maxValue + (maxValue * 0.1);
  }
}
