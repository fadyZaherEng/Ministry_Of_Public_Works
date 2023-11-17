import 'package:aim/src/config/utils/show_bottom_sheet_widget.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/presentation/screens/projects/widgets/projects_filter_bottom_sheet_widget.dart';
import 'package:aim/src/presentation/screens/risks/widgets/risks_filter_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

Future openRisksFilterBottomSheet({
  required BuildContext context,
  required double height,
  required List<Phase> phases,
  required Phase selectedPhase,
  required List<Status> status,
  required Status selectedStatus,
  required List<ProjectType> projectTypes,
  required ProjectType selectedProjectType,

  required Function(Phase, Status,ProjectType, DateTime?, DateTime?) onTap,
  required DateTime? selectedFromDate,
  required DateTime? selectedToDate,
  required String dateTitle,
}) {
  return showBottomSheetWidget(
    height: height,
    context: context,
    content: RisksFilterBottomSheetWidget(
      phases: phases,
      selectedPhase: selectedPhase,
      status: status,
      selectedStatus: selectedStatus,
      projectTypes:projectTypes,
      selectedProjectType:selectedProjectType,
      onTap: onTap,
      selectedFromDate: selectedFromDate,
      selectedToDate: selectedToDate,
      dateTitle: dateTitle,
    ),
  );
}
