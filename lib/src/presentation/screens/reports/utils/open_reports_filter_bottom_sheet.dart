import 'package:aim/src/config/utils/show_bottom_sheet_widget.dart';
import 'package:aim/src/domain/entities/filter/month.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:aim/src/presentation/screens/reports/widgets/reports_filter_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

Future openReportsFilterBottomSheet({
  required BuildContext context,
  required double height,
  required List<Phase> phases,
  required List<ProjectType> projectTypes,
  required List<Month> months,
  required List<Year> years,
  required Phase selectedPhase,
  required ProjectType selectedProjectType,
  required Month selectedMonth,
  required Year selectedYear,
  required Function(Phase, ProjectType,Month, Year) onTap,
}) {
  return showBottomSheetWidget(
    height: height,
    context: context,
    content: ReportsFilterBottomSheetWidget(
      phases: phases,
      projectTypes: projectTypes,
      selectedProjectType: selectedProjectType,
      months: months,
      years: years,
      selectedPhase: selectedPhase,
      selectedMonth: selectedMonth,
      selectedYear: selectedYear,
      onTap: onTap,
    ),
  );
}
