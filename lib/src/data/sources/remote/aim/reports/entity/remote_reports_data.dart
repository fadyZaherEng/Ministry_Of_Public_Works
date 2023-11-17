import 'package:aim/src/data/sources/remote/aim/reports/entity/remote_report.dart';
import 'package:aim/src/domain/entities/reports/reports_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_reports_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteReportsData extends ReportsData {
  @JsonKey(name: 'projectMonthlyReportsList')
  final List<RemoteReport>? reports;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  RemoteReportsData(
    this.reports,
    this.recordsTotal,
  ) : super(
          reports: reports ?? [],
          recordsTotal: recordsTotal ?? 0,
        );

  factory RemoteReportsData.fromJson(Map<String, dynamic> json) =>
      _$RemoteReportsDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteReportsDataToJson(this);
}
