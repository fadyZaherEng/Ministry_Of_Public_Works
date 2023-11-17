import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String? id;
  final String? projectName;
  final String? agreementNumber;
  final String? phaseName;
  final String? endUser;
  final String? sector;
  final String? creationDate;
  final String? projectEngineerName;
  final String? statusName;
  final double? contractAmount;
  final String? contractAmountstr;
  final String? totalPenaltiesstr;
  final double? totalPenalties;
  final double? penaltiesKPI;

  Project({
    this.id = "",
    this.projectName = "",
    this.agreementNumber = "",
    this.projectEngineerName = "",
    this.totalPenaltiesstr = "",
    this.creationDate = "",
    this.statusName = "",
    this.contractAmountstr = "",
    this.phaseName = "",
    this.endUser = "",
    this.sector = "",
    this.contractAmount = 0.0,
    this.totalPenalties = 0.0,
    this.penaltiesKPI = 0.0,
  });

  @override
  List<Object?> get props => [
        id,
        projectName,
        agreementNumber,
        projectEngineerName,
        creationDate,
        statusName,
        phaseName,
        endUser,
        contractAmountstr,
        totalPenaltiesstr,
        sector,
        contractAmount,
        totalPenalties,
        penaltiesKPI,
      ];
}
