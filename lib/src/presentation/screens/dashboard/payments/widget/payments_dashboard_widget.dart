import 'dart:math';

import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/domain/entities/dashboards/payments_chart.dart';
import 'package:aim/src/presentation/widgets/bar_chart_widget.dart';
import 'package:aim/src/presentation/widgets/bar_color_widget.dart';
import 'package:aim/src/presentation/widgets/dashboard_card_widget.dart';
import 'package:flutter/material.dart';

class PaymentsDashboardWidget extends StatefulWidget {
  final PaymentsChart paymentsChart;

  const PaymentsDashboardWidget({
    required this.paymentsChart,
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentsDashboardWidget> createState() =>
      _PaymentsDashboardWidgetState();
}

class _PaymentsDashboardWidgetState extends State<PaymentsDashboardWidget> {
  late List<BarChart> data;

  @override
  void initState() {
    super.initState();
    data = [
      BarChart([
        BarData(S.current.mega, widget.paymentsChart.mega?.lessThan?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.paymentsChart.sanitary?.lessThan?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.paymentsChart.construction?.lessThan?.toDouble() ?? 0.0),
      ], ColorSchema.barGreen),
      BarChart([
        BarData(S.current.mega, widget.paymentsChart.mega?.moreThan?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.paymentsChart.sanitary?.moreThan?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.paymentsChart.construction?.moreThan?.toDouble() ?? 0.0),
      ], ColorSchema.barRed),
    ];
  }

  @override
  void didUpdateWidget(covariant PaymentsDashboardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    data.clear();
    data = [
      BarChart([
        BarData(S.current.mega, widget.paymentsChart.mega?.lessThan?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.paymentsChart.sanitary?.lessThan?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.paymentsChart.construction?.lessThan?.toDouble() ?? 0.0),
      ], ColorSchema.barGreen),
      BarChart([
        BarData(S.current.mega, widget.paymentsChart.mega?.moreThan?.toDouble() ?? 0.0),
        BarData(S.current.sanitary,
            widget.paymentsChart.sanitary?.moreThan?.toDouble() ?? 0.0),
        BarData(S.current.construction,
            widget.paymentsChart.construction?.moreThan?.toDouble() ?? 0.0),
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
                    _sectionTitle(S.of(context).paymentAnalysis),
                    const SizedBox(height: 22),
                    BarChartWidget(
                      maximumLabels: 3,
                      labelRotation: 0,
                      data: data,
                      height: 250,
                      width: 0.3,
                      minimum: 0,
                      maximum: getMax(widget.paymentsChart),
                      interval: 1,
                    ),
                    const SizedBox(height: 12),
                    BarColorWidget(
                      barColors: [
                        BarColorModel(
                          title: S.of(context).paymentVariantGreen,
                          color: ColorSchema.barGreen,
                        ),
                        BarColorModel(
                          title: S.of(context).paymentVariantRed,
                          color: ColorSchema.barRed,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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

  double getMax(PaymentsChart paymentsChart) {
    double maxValue = max(
      paymentsChart.mega?.maxValue ?? 0.0,
      max(
        paymentsChart.sanitary?.maxValue ?? 0.0,
        paymentsChart.construction?.maxValue ?? 0.0,
      ),
    );
    return maxValue + (maxValue * 0.1);
  }
}
