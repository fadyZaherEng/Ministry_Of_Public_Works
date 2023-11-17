import 'package:aim/src/domain/entities/dashboards/variations_chart_item.dart';
import 'package:aim/src/domain/entities/design/design_chart_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_design_chart_item.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteDesignChartItem extends DesignChartItem {
  @JsonKey(name: 'totalDelayLess')
  final int? totalDelayLess;
  @JsonKey(name: 'totalDelayMore')
  final int? totalDelayMore;

  const RemoteDesignChartItem(
      this.totalDelayLess,
      this.totalDelayMore,
      ) : super(
    totalDelayLess: totalDelayLess ?? 0,
    totalDelayMore: totalDelayMore ?? 0,
  );

  factory RemoteDesignChartItem.fromJson(Map<String, dynamic> json) =>
      _$RemoteDesignChartItemFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteDesignChartItemToJson(this);
}