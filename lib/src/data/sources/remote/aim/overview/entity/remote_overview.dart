import 'package:aim/src/domain/entities/overview/overview.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_overview.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteOverview extends Overview {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'contractNumber')
  final String? agreementNumber;
  @JsonKey(name: 'phase')
  final String? phaseName;
  @JsonKey(name: 'projectSector')
  final String? projectSector;
  @JsonKey(name: 'creationDatestr')
  final String? creationDate;
  @JsonKey(name: 'projectEngineer')
  final String? projectEngineer;
  @JsonKey(name: 'contractAmountstr')
  final String? contractAmount;

  RemoteOverview(
    this.id,
    this.projectName,
    this.agreementNumber,
    this.phaseName,
    this.projectSector,
    this.creationDate,
    this.projectEngineer,
    this.contractAmount,
  ) : super(
          id: id ?? "",
          projectName: projectName ?? "",
          agreementNumber: agreementNumber ?? "",
          phaseName: phaseName ?? "",
          sector: projectSector ?? "",
          creationDate: creationDate ?? "",
          projectEngineer: projectEngineer ?? "",
          contractAmount: contractAmount ?? "",
        );

  factory RemoteOverview.fromJson(Map<String, dynamic> json) =>
      _$RemoteOverviewFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOverviewToJson(this);
}
