import 'package:aim/src/data/sources/remote/aim/milestones/entity/remote_milestone.dart';
import 'package:aim/src/domain/entities/milestones/milestones_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_milestones_data.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteMilestonesData extends MilestonesData {
  @JsonKey(name: 'projectMilestonesList')
  final List<RemoteMilestone>? milestones;
  @JsonKey(name: 'recordsTotal')
  final int? recordsTotal;

  RemoteMilestonesData(
    this.milestones,
    this.recordsTotal,
  ) : super(
          milestones: milestones ?? [],
          recordsTotal: recordsTotal ?? 0,
        );

  factory RemoteMilestonesData.fromJson(Map<String, dynamic> json) =>
      _$RemoteMilestonesDataFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteMilestonesDataToJson(this);
}
