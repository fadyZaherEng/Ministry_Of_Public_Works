import 'package:aim/src/data/sources/remote/aim/project/entity/remote_attachment.dart';
import 'package:aim/src/domain/entities/variations/variation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_variation.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteVariation extends Variation {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'contractNumber')
  final String? agreementNumber;
  @JsonKey(name: 'userWhoAskedForVariationOrderstr')
  final String? userWhoAskedForVariationOrderstr;
  @JsonKey(name: 'justification')
  final String? justification;
  @JsonKey(name: 'projectManager')
  final String? projectEngineer;
  @JsonKey(name: 'projectSector')
  final String? sector;
  @JsonKey(name: 'variationOrderTotalstr')
  final String? variation;
  @JsonKey(name: 'variationOrderValuestr')
  final String? variationValueStr;
  @JsonKey(name: 'contractAmountstr')
  final String? contractAmount;
  @JsonKey(name: 'variationOrdersKPI')
  final double? variationKPI;
  @JsonKey(name: 'datestr')
  final String? date;
  @JsonKey(name: 'phasestr')
  final String? projectPhase;
  @JsonKey(name: 'impactOnCoststr')
  final String? impactOnCost;
  @JsonKey(name: 'getAttachments')
  final List<RemoteAttachment>? attachments;

  const RemoteVariation(
    this.id,
    this.projectName,
    this.agreementNumber,
    this.projectPhase,
    this.projectEngineer,
    this.contractAmount,
    this.sector,
    this.variationKPI,
    this.variationValueStr,
    this.variation,
    this.date,
    this.impactOnCost,
    this.attachments,
    this.userWhoAskedForVariationOrderstr,
    this.justification,
  ) : super(
          id: id ?? "",
          projectName: projectName ?? "",
          projectPhase: projectPhase ?? "",
          agreementNumber: agreementNumber ?? "",
          projectEngineer: projectEngineer ?? "",
          sector: sector ?? "",
          variation: variation ?? "",
          variationKPI: variationKPI ?? 0.0,
          contractAmount: contractAmount ?? "",
    variationValueStr: variationValueStr ?? "",
          date: date ?? "",
          impactOnCost: impactOnCost ?? "",
    userWhoAskedForVariationOrderstr: userWhoAskedForVariationOrderstr ?? "",
    justification: justification ?? "",
          attachments: attachments ?? const [],
        );

  factory RemoteVariation.fromJson(Map<String, dynamic> json) =>
      _$RemoteVariationFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteVariationToJson(this);
}
