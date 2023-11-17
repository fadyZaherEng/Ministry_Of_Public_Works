import 'package:aim/src/data/sources/remote/aim/payments/entity/remote_payments_chart_item.dart';
import 'package:aim/src/domain/entities/dashboards/payments_chart.dart';
import 'package:aim/src/domain/entities/dashboards/payments_chart_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_payments_chart.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePaymentsChart extends PaymentsChart {
  @JsonKey(name: 'mega')
  final RemotePaymentsChartItem? mega;
  @JsonKey(name: 'sanitary')
  final RemotePaymentsChartItem? sanitary;
  @JsonKey(name: 'construction')
  final RemotePaymentsChartItem? construction;

  const RemotePaymentsChart(
    this.mega,
    this.sanitary,
    this.construction,
  ) : super(
          mega: mega ?? const PaymentsChartItem(),
          sanitary: sanitary ?? const PaymentsChartItem(),
          construction: construction ?? const PaymentsChartItem(),
        );

  factory RemotePaymentsChart.fromJson(Map<String, dynamic> json) =>
      _$RemotePaymentsChartFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePaymentsChartToJson(this);
}
