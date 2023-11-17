import 'package:aim/src/domain/entities/dashboards/variations_chart_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_variations_chart_item.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteVariationsChartItem extends VariationsChartItem {
  @JsonKey(name: 'lessThan')
  final int? lessThan;
  @JsonKey(name: 'between')
  final int? between;
  @JsonKey(name: 'moreThan')
  final int? moreThan;

  const RemoteVariationsChartItem(
      this.lessThan,
      this.between,
      this.moreThan,
      ) : super(
    lessThan: lessThan ?? 0,
    between: between ?? 0,
    moreThan: moreThan ?? 0,
  );

  factory RemoteVariationsChartItem.fromJson(Map<String, dynamic> json) =>
      _$RemoteVariationsChartItemFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteVariationsChartItemToJson(this);
}