import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:equatable/equatable.dart';

class Payment extends Equatable {
  final String? id;
  final String? projectName;
  final String? agreementNumber;
  final String? projectSector;
  final String? title;
  final String? phase;
  final double? paymentAmount;
  final double? paymentVariance;
  final String? paymentDatestr;
  final String? plannedPaymentDate;
  final String? actualPaymentDate;
  final String? status;
  final List<Attachment>? attachments;

  const Payment({
    this.id = "",
    this.projectName = "",
    this.agreementNumber = "",
    this.projectSector = "",
    this.title = "",
    this.phase = "",
    this.paymentAmount = 0.0,
    this.paymentVariance = 0.0,
    this.paymentDatestr = "",
    this.plannedPaymentDate = "",
    this.actualPaymentDate = "",
    this.status = "",
    this.attachments = const [],
  });

  @override
  List<Object?> get props => [
        id,
        projectName,
        agreementNumber,
        projectSector,
        title,
        phase,
        paymentAmount,
    paymentDatestr,
        plannedPaymentDate,
    paymentVariance,
        actualPaymentDate,
        status,
        attachments,
      ];
}
