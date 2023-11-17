import 'package:aim/src/domain/entities/dashboards/payments_chart_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_payments_chart_item.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePaymentsChartItem extends PaymentsChartItem {
  @JsonKey(name: 'lessThan')
  final int? lessThan;
  @JsonKey(name: 'moreThan')
  final int? moreThan;

  const RemotePaymentsChartItem(
      this.lessThan,
      this.moreThan,
      ) : super(
    lessThan: lessThan ?? 0,
    moreThan: moreThan ?? 0,
  );

  factory RemotePaymentsChartItem.fromJson(Map<String, dynamic> json) =>
      _$RemotePaymentsChartItemFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePaymentsChartItemToJson(this);
}