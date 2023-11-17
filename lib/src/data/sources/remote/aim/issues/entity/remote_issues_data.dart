import 'package:aim/src/data/sources/remote/aim/issues/entity/remote_issue.dart';
import 'package:aim/src/domain/entities/issues/issues_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_issues_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteIssuesData extends IssuesData {
  @JsonKey(name: 'projectIssuesList')
  final List<RemoteIssue>? issues;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  RemoteIssuesData(
    this.issues,
    this.recordsTotal,
  ) : super(
          issues: issues ?? [],
          recordsTotal: recordsTotal ?? 0,
        );

  factory RemoteIssuesData.fromJson(Map<String, dynamic> json) =>
      _$RemoteIssuesDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIssuesDataToJson(this);
}
