import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:equatable/equatable.dart';

class Penalty extends Equatable {
  final String? id;
  final String? projectName;
  final String? agreementNumber;
  final String? projectEngineer;
  final String? contractor;
  final String? type;
  final double? amount;
  final String? date;
  final String? projectSector;
  final String? phaseName;
  final String? penaltiesDescription;
  final List<Attachment>? attachments;

  const Penalty({
    this.id = "",
    this.projectName = "",
    this.projectSector = "",
    this.penaltiesDescription = "",
    this.phaseName = "",
    this.agreementNumber = "",
    this.projectEngineer = "",
    this.contractor = "",
    this.type = "",
    this.amount = 0.0,
    this.date = "",
    this.attachments = const [],
  });

  @override
  List<Object?> get props => [
        id,
        projectName,
        agreementNumber,
        projectEngineer,
        contractor,
        type,
        projectSector,
        phaseName,
        penaltiesDescription,
        amount,
        date,
        attachments,
      ];
}
