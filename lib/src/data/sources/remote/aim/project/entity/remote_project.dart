import 'package:aim/src/domain/entities/project/project.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_project.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteProject extends Project {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'contractNumber')
  final String? agreementNumber;
  @JsonKey(name: 'phaseName')
  final String? phaseName;
  @JsonKey(name: 'projectStatusstr')
  final String? statusName;
  @JsonKey(name: 'beneficiaryName')
  final String? beneficiaryName;
  @JsonKey(name: 'projectSector')
  final String? projectSector;
  @JsonKey(name: 'creationDatestr')
  final String? creationDate;
  @JsonKey(name: 'projectEngineerName')
  final String? projectEngineerName;
  @JsonKey(name: 'contractAmountstr')
  final String? contractAmountstr;
  @JsonKey(name: 'totalPenaltiesstr')
  final String? totalPenaltiesstr;
  @JsonKey(name: 'contractAmount')
  final double? contractAmount;
  @JsonKey(name: 'totalPenalties')
  final double? totalPenalties;
  @JsonKey(name: 'penaltiesKPI')
  final double? penaltiesKPI;

  RemoteProject(
    this.id,
    this.projectName,
    this.agreementNumber,
    this.phaseName,
    this.statusName,
    this.beneficiaryName,
    this.projectSector,
    this.creationDate,
    this.projectEngineerName,
    this.contractAmountstr,
    this.totalPenaltiesstr,
    this.contractAmount,
    this.totalPenalties,
    this.penaltiesKPI,
  ) : super(
          id: id ?? "",
          projectName: projectName ?? "",
          agreementNumber: agreementNumber ?? "",
          contractAmountstr: contractAmountstr ?? "",
    totalPenaltiesstr: totalPenaltiesstr ?? "",
          phaseName: phaseName ?? "",
          statusName: statusName ?? "",
          endUser: beneficiaryName ?? "",
          sector: projectSector ?? "",
          creationDate: creationDate ?? "",
          projectEngineerName: projectEngineerName ?? "",
          contractAmount: contractAmount ?? 0.0,
          totalPenalties: totalPenalties ?? 0.0,
          penaltiesKPI: penaltiesKPI ?? 0.0,
        );

  factory RemoteProject.fromJson(Map<String, dynamic> json) =>
      _$RemoteProjectFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteProjectToJson(this);
}
