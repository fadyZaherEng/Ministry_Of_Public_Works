import 'package:aim/src/domain/entities/dashboards/payments_chart_item.dart';
import 'package:equatable/equatable.dart';

class PaymentsChart extends Equatable {
  final PaymentsChartItem? mega;
  final PaymentsChartItem? sanitary;
  final PaymentsChartItem? construction;

  const PaymentsChart({
    this.mega = const PaymentsChartItem(),
    this.sanitary = const PaymentsChartItem(),
    this.construction = const PaymentsChartItem(),
  });

  @override
  List<Object?> get props => [];
}
