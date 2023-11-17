import 'package:aim/src/data/sources/remote/aim/project/entity/remote_attachment.dart';
import 'package:aim/src/domain/entities/warranties/warranty.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_warranty.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteWarranty extends Warranty {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'contractNumber')
  final String? agreementNumber;
  @JsonKey(name: 'projectSector')
  final String? projectSector;
  @JsonKey(name: 'phasestr')
  final String? phase;
  @JsonKey(name: 'warrantyDescription')
  final String? warrantyDescription;
  @JsonKey(name: 'warrantiesTypesstr')
  final String? warrantiesType;
  @JsonKey(name: 'warrantyAmount')
  final double? warrantyAmount;
  @JsonKey(name: 'warrantyStartdatestr')
  final String? warrantyStartDate;
  @JsonKey(name: 'warrantyExpiryDatestr')
  final String? warrantyExpiryDate;
  @JsonKey(name: 'getAttachments')
  final List<RemoteAttachment>? attachments;

  const RemoteWarranty(
    this.id,
    this.projectName,
    this.agreementNumber,
    this.projectSector,
    this.warrantiesType,
    this.warrantyAmount,
    this.warrantyStartDate,
    this.warrantyExpiryDate,
    this.warrantyDescription,
    this.attachments,
    this.phase,
  ) : super(
          id: id ?? "",
          projectName: projectName ?? "",
          agreementNumber: agreementNumber ?? "",
          warrantyType: warrantiesType ?? "",
          warrantyAmount: warrantyAmount ?? 0.0,
          startDate: warrantyStartDate ?? "",
          endDate: warrantyExpiryDate ?? "",
          sector: projectSector ?? "",
          phase: phase ?? "",
          warrantyDescription: warrantyDescription ?? "",
          attachments: attachments ?? const [],
        );

  factory RemoteWarranty.fromJson(Map<String, dynamic> json) =>
      _$RemoteWarrantyFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteWarrantyToJson(this);
}
