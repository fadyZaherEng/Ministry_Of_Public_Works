import 'package:aim/src/config/utils/show_bottom_sheet_widget.dart';
import 'package:aim/src/domain/entities/filter/end_user.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/presentation/screens/projects/widgets/projects_filter_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

Future openProjectsFilterBottomSheet({
  required BuildContext context,
  required double height,
  required List<Phase> phases,
  required Phase selectedPhase,
  required List<ProjectType> projectTypes,
  required ProjectType selectedProjectType,
  required Function(Phase, ProjectType, DateTime?, DateTime?,EndUser) onTap,
  required DateTime? selectedFromDate,
  required DateTime? selectedToDate,
  required EndUser selectedEndUser,
  required List<EndUser> endUsers,
}) {
  return showBottomSheetWidget(
    height: height,
    context: context,
    content: ProjectsFilterBottomSheetWidget(
      phases: phases,
      selectedPhase: selectedPhase,
      projectTypes: projectTypes,
      selectedProjectType: selectedProjectType,
      onTap: onTap,
      selectedFromDate: selectedFromDate,
      selectedToDate: selectedToDate,
      selectedEndUser: selectedEndUser,
      endUsers: endUsers,
    ),
  );
}
