import 'package:aim/src/domain/entities/contract/contract.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_contract.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteContract extends Contract {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'projectName')
  final String? projectName;
  @JsonKey(name: 'contractNumber')
  final String? agreementNumber;
  @JsonKey(name: 'projectSector')
  final String? sector;
  @JsonKey(name: 'approved')
  final String? approved;
  @JsonKey(name: 'operationandMaintenanceContract')
  final String? operationandMaintenanceContract;
  @JsonKey(name: 'delay')
  final String? delay;
  @JsonKey(name: 'variancePercentage')
  final String? variancePercentage;

  const RemoteContract(
    this.id,
    this.projectName,
    this.agreementNumber,
    this.sector,
    this.approved,
    this.operationandMaintenanceContract,
    this.delay,
    this.variancePercentage,
  ) : super(
          id: id ?? "",
          projectName: projectName ?? "",
          agreementNumber: agreementNumber ?? "",
          sector: sector ?? "",
          approved: approved ?? "",
          operationandMaintenanceContract:
              operationandMaintenanceContract ?? "",
          delay: delay ?? "",
          variancePercentage: variancePercentage ?? "",
        );

  factory RemoteContract.fromJson(Map<String, dynamic> json) =>
      _$RemoteContractFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteContractToJson(this);
}
