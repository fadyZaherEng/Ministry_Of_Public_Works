import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:equatable/equatable.dart';

class Milestone extends Equatable {
  final String? id;
  final String? projectName;
  final String? title;
  final String? projectPhase;
  final String? plannedFinishDate;
  final String? actualFinishDate;
  final String? status;
  final String? sector;
  final List<Attachment>? attachments;

  const Milestone({
    this.id = "",
    this.projectName = "",
    this.title = "",
    this.projectPhase = "",
    this.plannedFinishDate = "",
    this.actualFinishDate = "",
    this.status = "",
    this.sector = "",
    this.attachments = const [],
  });

  @override
  List<Object?> get props => [
        id,
        projectName,
        title,
        projectPhase,
        plannedFinishDate,
        actualFinishDate,
        status,
    sector,
        attachments,
      ];
}
