import 'package:aim/src/data/sources/remote/aim/project/entity/remote_attachment.dart';
import 'package:aim/src/domain/entities/penalties/penalty.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_penalty.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePenalty extends Penalty {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'contractNumber')
  final String? agreementNumber;
  @JsonKey(name: 'phaseName')
  final String? phaseName;
  @JsonKey(name: 'projectSector')
  final String? projectSector;
  @JsonKey(name: 'projectManager')
  final String? projectEngineer;
  @JsonKey(name: 'contractor')
  final String? contractor;
  @JsonKey(name: 'penaltiesTypesstr')
  final String? type;
  @JsonKey(name: 'penaltyAmount')
  final double? amount;
  @JsonKey(name: 'penaltyDatestr')
  final String? date;
  @JsonKey(name: 'penaltiesDescription')
  final String? penaltiesDescription;
  @JsonKey(name: 'getAttachments')
  final List<RemoteAttachment>? attachments;

  const RemotePenalty(
    this.id,
    this.projectName,
    this.agreementNumber,
    this.projectEngineer,
    this.contractor,
    this.type,
    this.amount,
    this.date,
    this.attachments,
    this.phaseName,
    this.penaltiesDescription,
    this.projectSector,
  ) : super(
          id: id ?? "",
          projectName: projectName ?? "",
          penaltiesDescription: penaltiesDescription ?? "",
          agreementNumber: agreementNumber ?? "",
          projectEngineer: projectEngineer ?? "",
          contractor: contractor ?? "",
          type: type ?? "",
          amount: amount ?? 0.0,
          date: date ?? "",
          phaseName: phaseName ?? "",
          projectSector: projectSector ?? "",
          attachments: attachments ?? const [],
        );

  factory RemotePenalty.fromJson(Map<String, dynamic> json) =>
      _$RemotePenaltyFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePenaltyToJson(this);
}
