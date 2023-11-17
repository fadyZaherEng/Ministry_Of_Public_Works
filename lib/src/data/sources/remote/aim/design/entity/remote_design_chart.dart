import 'package:aim/src/data/sources/remote/aim/design/entity/remote_design_chart_item.dart';
import 'package:aim/src/domain/entities/design/design_chart.dart';
import 'package:aim/src/domain/entities/design/design_chart_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_design_chart.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteDesignChart extends DesignChart {
  @JsonKey(name: 'mega')
  final RemoteDesignChartItem? mega;
  @JsonKey(name: 'sanitary')
  final RemoteDesignChartItem? sanitary;
  @JsonKey(name: 'construction')
  final RemoteDesignChartItem? construction;

  const RemoteDesignChart(
    this.mega,
    this.sanitary,
    this.construction,
  ) : super(
          mega: mega ?? const DesignChartItem(),
          sanitary: sanitary ?? const DesignChartItem(),
          construction: construction ?? const DesignChartItem(),
        );

  factory RemoteDesignChart.fromJson(Map<String, dynamic> json) =>
      _$RemoteDesignChartFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteDesignChartToJson(this);
}
