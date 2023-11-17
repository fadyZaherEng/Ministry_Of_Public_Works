import 'package:aim/src/domain/entities/project/project.dart';
import 'package:equatable/equatable.dart';

class ProjectData extends Equatable {
  final List<Project>? projects;
  final int? recordsTotal;

  const ProjectData({
    this.projects = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        projects,
        recordsTotal,
      ];
}
