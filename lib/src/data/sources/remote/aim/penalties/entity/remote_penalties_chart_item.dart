import 'package:aim/src/domain/entities/dashboards/penalties_chart_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_penalties_chart_item.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePenaltiesChartItem extends PenaltiesChartItem {
  @JsonKey(name: 'noPenalty')
  final int? noPenalty;
  @JsonKey(name: 'lessThanTen')
  final int? lessThanTen;
  @JsonKey(name: 'moreThanTen')
  final int? moreThanTen;

  const RemotePenaltiesChartItem(
      this.noPenalty,
      this.lessThanTen,
      this.moreThanTen,
      ) : super(
    noPenalty: noPenalty ?? 0,
    lessThanTen: lessThanTen ?? 0,
    moreThanTen: moreThanTen ?? 0,
  );

  factory RemotePenaltiesChartItem.fromJson(Map<String, dynamic> json) =>
      _$RemotePenaltiesChartItemFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePenaltiesChartItemToJson(this);
}