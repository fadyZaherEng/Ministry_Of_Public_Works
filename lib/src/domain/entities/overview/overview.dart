import 'package:equatable/equatable.dart';

class Overview extends Equatable {
  final String? id;
  final String? projectName;
  final String? agreementNumber;
  final String? phaseName;
  final String? sector;
  final String? creationDate;
  final String? projectEngineer;
  final String? contractAmount;

  Overview({
    this.id = "",
    this.projectName = "",
    this.agreementNumber = "",
    this.projectEngineer = "",
    this.creationDate = "",
    this.phaseName = "",
    this.sector = "",
    this.contractAmount = "",
  });

  @override
  List<Object?> get props => [
        id,
        projectName,
        agreementNumber,
        projectEngineer,
        creationDate,
        phaseName,
        sector,
        contractAmount,
      ];
}
