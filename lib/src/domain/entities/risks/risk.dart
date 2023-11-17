import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:equatable/equatable.dart';

class Risk extends Equatable {
  final String? id;
  final String? projectName;
  final String? agreementNumber;
  final String? projectSector;
  final String? title;
  final String? projectPhase;
  final String? assignedTo;
  final double? probability;
  final double? impact;
  final String? severity;
  final String? status;
  final String? dueDate;
  final String? description;
  final List<Attachment>? attachments;

  const Risk({
    this.id = "",
    this.projectName = "",
    this.agreementNumber = "",
    this.projectSector = "",
    this.title = "",
    this.projectPhase = "",
    this.assignedTo = "",
    this.probability = 0.0,
    this.impact = 0.0,
    this.severity = "",
    this.status = "",
    this.dueDate = "",
    this.description = "",
    this.attachments = const [],
  });

  @override
  List<Object?> get props => [
        id,
        projectName,
        agreementNumber,
        projectSector,
        title,
        projectPhase,
        probability,
        assignedTo,
        status,
        dueDate,
        severity,
        impact,
        description,
        attachments,
      ];
}
