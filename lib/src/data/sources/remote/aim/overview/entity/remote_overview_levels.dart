import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:json_annotation/json_annotation.dart';


part 'remote_overview_levels.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteOverviewLevels extends Levels {
  @JsonKey(name: 'projects')
  final int? projects;

  const RemoteOverviewLevels(
    this.projects,
  ) : super(
    low: projects ?? 0,
    meduim: 0,
    high: 0,
  );

  factory RemoteOverviewLevels.fromJson(Map<String, dynamic> json) =>
      _$RemoteOverviewLevelsFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOverviewLevelsToJson(this);

}
