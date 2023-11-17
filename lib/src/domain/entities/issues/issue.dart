import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:equatable/equatable.dart';

class Issue extends Equatable {
  final String? id;
  final String? projectName;
  final String? agreementNumber;
  final String? projectSector;
  final String? title;
  final String? projectPhase;
  final double? priority;
  final String? assignedTo;
  final String? status;
  final String? dueDate;
  final String? description;
  final List<Attachment>? attachments;

  const Issue({
    this.id = "",
    this.projectName = "",
    this.agreementNumber = "",
    this.projectSector = "",
    this.title = "",
    this.projectPhase = "",
    this.priority = 0.0,
    this.assignedTo = "",
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
        priority,
        assignedTo,
        status,
        dueDate,
        attachments,
    description,
      ];
}
