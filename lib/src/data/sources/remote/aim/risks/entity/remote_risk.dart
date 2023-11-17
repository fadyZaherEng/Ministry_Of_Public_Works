import 'package:aim/src/data/sources/remote/aim/project/entity/remote_attachment.dart';
import 'package:aim/src/domain/entities/risks/risk.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_risk.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteRisk extends Risk {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'contractNumber')
  final String? agreementNumber;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'phasestr')
  final String? projectPhase;
  @JsonKey(name: 'assignedTo')
  final String? assignedTo;
  @JsonKey(name: 'riskProbability')
  final double? probability;
  @JsonKey(name: 'impact')
  final double? impact;
  @JsonKey(name: 'exposurestr')
  final String? severity;
  @JsonKey(name: 'statusstr')
  final String? status;
  @JsonKey(name: 'dueDatestr')
  final String? dueDate;
  @JsonKey(name: 'projectSector')
  final String? projectSector;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'getAttachments')
  final List<RemoteAttachment>? attachments;

  const RemoteRisk(
    this.id,
    this.projectName,
    this.agreementNumber,
    this.description,
    this.status,
    this.title,
    this.projectPhase,
    this.dueDate,
    this.assignedTo,
    this.impact,
    this.severity,
    this.projectSector,
    this.probability,
    this.attachments,
  ) : super(
          id: id ?? "",
          projectName: projectName ?? "",
          agreementNumber: agreementNumber ?? "",
          status: status ?? "",
          title: title ?? "",
          projectPhase: projectPhase ?? "",
          projectSector: projectSector ?? "",
          assignedTo: assignedTo ?? "",
          description: description ?? "",
          dueDate: dueDate ?? "",
          probability: probability ?? 0.0,
          impact: impact ?? 0.0,
          severity: severity ?? "",
          attachments: attachments ?? const [],
        );

  factory RemoteRisk.fromJson(Map<String, dynamic> json) =>
      _$RemoteRiskFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteRiskToJson(this);
}
