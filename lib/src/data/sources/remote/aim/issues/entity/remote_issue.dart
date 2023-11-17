import 'package:aim/src/data/sources/remote/aim/project/entity/remote_attachment.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_issue.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteIssue extends Issue {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'phasestr')
  final String? projectPhase;
  @JsonKey(name: 'priority')
  final double? priority;
  @JsonKey(name: 'assignedTo')
  final String? assignedTo;
  @JsonKey(name: 'statusstr')
  final String? status;
  @JsonKey(name: 'dueDatestr')
  final String? dueDate;
  @JsonKey(name: 'contractNumber')
  final String? agreementNumber;
  @JsonKey(name: 'projectSector')
  final String? projectSector;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'getAttachments')
  final List<RemoteAttachment>? attachments;

  const RemoteIssue(
    this.id,
    this.projectName,
    this.agreementNumber,
    this.projectSector,
    this.status,
    this.title,
    this.projectPhase,
    this.dueDate,
    this.assignedTo,
    this.priority,
    this.attachments,
    this.description,
  ) : super(
          id: id ?? "",
          projectName: projectName ?? "",
          agreementNumber: agreementNumber ?? "",
          projectSector: projectSector ?? "",
          status: status ?? "",
          title: title ?? "",
          projectPhase: projectPhase ?? "",
          assignedTo: assignedTo ?? "",
          dueDate: dueDate ?? "",
          priority: priority ?? 0.0,
          description: description ?? "",
          attachments: attachments ?? const [],
        );

  factory RemoteIssue.fromJson(Map<String, dynamic> json) =>
      _$RemoteIssueFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIssueToJson(this);
}
