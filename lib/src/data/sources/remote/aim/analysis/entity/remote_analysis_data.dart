import 'package:aim/src/data/sources/remote/aim/analysis/entity/remote_analysis.dart';
import 'package:aim/src/data/sources/remote/aim/reports/entity/remote_report.dart';
import 'package:aim/src/domain/entities/analysis/analysis.dart';
import 'package:aim/src/domain/entities/analysis/analysis_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_analysis_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteAnalysisData extends AnalysisData {
  @JsonKey(name: 'projectMonthlyReportsList')
  final List<RemoteAnalysis>? analysis;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  RemoteAnalysisData(
    this.analysis,
    this.recordsTotal,
  ) : super(
          analysis: analysis ?? [],
          recordsTotal: recordsTotal ?? 0,
        );

  factory RemoteAnalysisData.fromJson(Map<String, dynamic> json) =>
      _$RemoteAnalysisDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAnalysisDataToJson(this);
}
