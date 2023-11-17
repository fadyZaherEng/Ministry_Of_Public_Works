import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_issues_phase_levels.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteIssuesPhaseLevels extends Levels {
  @JsonKey(name: 'issues')
  final int? issues;

  const RemoteIssuesPhaseLevels(
    this.issues,
  ) : super(
    low: issues ?? 0,
    meduim: 0,
    high: 0,
  );

  factory RemoteIssuesPhaseLevels.fromJson(Map<String, dynamic> json) =>
      _$RemoteIssuesPhaseLevelsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIssuesPhaseLevelsToJson(this);

}
