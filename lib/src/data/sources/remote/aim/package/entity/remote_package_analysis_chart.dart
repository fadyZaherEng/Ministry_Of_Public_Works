import 'package:aim/src/data/sources/remote/aim/package/entity/remote_package_levels.dart';
import 'package:aim/src/domain/entities/package/package_analysis_chart.dart';
import 'package:aim/src/domain/entities/package/packaget_levels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_package_analysis_chart.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePackageAnalysisChart extends PackageAnalysisChart {
  @JsonKey(name: 'mega')
  final RemotePackageLevels? mega;
  @JsonKey(name: 'sanitary')
  final RemotePackageLevels? sanitary;
  @JsonKey(name: 'construction')
  final RemotePackageLevels? construction;

  RemotePackageAnalysisChart(
      this.mega,
      this.sanitary,
      this.construction,
      ) : super(
    mega: mega ?? PackageLevels(),
    sanitary: sanitary ?? PackageLevels(),
    construction: construction ?? PackageLevels(),
  );

  factory RemotePackageAnalysisChart.fromJson(Map<String, dynamic> json) =>
      _$RemotePackageAnalysisChartFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePackageAnalysisChartToJson(this);
}
