import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_issues_levels.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteIssuesLevels extends Levels {
  @JsonKey(name: 'lowPriority')
  final int? lowPriority;
  @JsonKey(name: 'meduimPriority')
  final int? meduimPriority;
  @JsonKey(name: 'highPriority')
  final int? highPriority;

  const RemoteIssuesLevels(
    this.lowPriority,
    this.meduimPriority,
    this.highPriority,
  ) : super(
    low: lowPriority ?? 0,
    meduim: meduimPriority ?? 0,
    high: highPriority ?? 0,
  );

  factory RemoteIssuesLevels.fromJson(Map<String, dynamic> json) =>
      _$RemoteIssuesLevelsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIssuesLevelsToJson(this);

}
