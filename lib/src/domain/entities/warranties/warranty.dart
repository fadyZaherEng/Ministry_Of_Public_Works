import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:equatable/equatable.dart';

class Warranty extends Equatable {
  final String? id;
  final String? projectName;
  final String? agreementNumber;
  final String? warrantyType;
  final double? warrantyAmount;
  final String? startDate;
  final String? endDate;
  final String? sector;
  final String? warrantyDescription;
  final String? phase;
  final List<Attachment>? attachments;

  const Warranty({
    this.id = "",
    this.projectName = "",
    this.agreementNumber = "",
    this.warrantyType = "",
    this.warrantyAmount = 0.0,
    this.startDate = "",
    this.endDate = "",
    this.sector = "",
    this.warrantyDescription = "",
    this.phase = "",
    this.attachments = const [],
  });

  @override
  List<Object?> get props => [
        id,
        projectName,
        agreementNumber,
        warrantyType,
        warrantyAmount,
        startDate,
        endDate,
        warrantyDescription,
        phase,
        sector,
        attachments,
      ];
}
