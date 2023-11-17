import 'package:equatable/equatable.dart';

class Contract extends Equatable {
  final String? id;
  final String? projectName;
  final String? agreementNumber;
  final String? approved;
  final String? operationandMaintenanceContract;
  final String? delay;
  final String? variancePercentage;
  final String? sector;

  const Contract({
    this.id = "",
    this.projectName = "",
    this.agreementNumber = "",
    this.approved = "",
    this.operationandMaintenanceContract = "",
    this.delay = "",
    this.variancePercentage = "",
    this.sector = "",
  });

  @override
  List<Object?> get props => [
        id,
        projectName,
        agreementNumber,
        approved,
    operationandMaintenanceContract,
        delay,
        variancePercentage,
        sector,
      ];
}
