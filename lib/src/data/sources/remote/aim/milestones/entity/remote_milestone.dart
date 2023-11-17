import 'package:aim/src/data/sources/remote/aim/project/entity/remote_attachment.dart';
import 'package:aim/src/domain/entities/milestones/milestone.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_milestone.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteMilestone extends Milestone {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'phasestr')
  final String? projectPhase;
  @JsonKey(name: 'plannedFinishDatestr')
  final String? plannedFinishDate;
  @JsonKey(name: 'actualFinishDatestr')
  final String? actualFinishDate;
  @JsonKey(name: 'statusstr')
  final String? status;
  @JsonKey(name: 'projectSector')
  final String? projectSector;
  @JsonKey(name: 'getAttachments')
  final List<RemoteAttachment>? attachments;

  const RemoteMilestone(
    this.id,
    this.projectName,
    this.status,
    this.title,
    this.projectPhase,
    this.actualFinishDate,
    this.plannedFinishDate,
    this.attachments,
    this.projectSector,
  ) : super(
          id: id ?? "",
          projectName: projectName ?? "",
          status: status ?? "",
          title: title ?? "",
          projectPhase: projectPhase ?? "",
          actualFinishDate: actualFinishDate ?? "",
          plannedFinishDate: plannedFinishDate ?? "",
          attachments: attachments ?? const [],
          sector: projectSector ?? "",
        );

  factory RemoteMilestone.fromJson(Map<String, dynamic> json) =>
      _$RemoteMilestoneFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteMilestoneToJson(this);
}
