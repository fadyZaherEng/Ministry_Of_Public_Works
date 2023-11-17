import 'package:aim/src/config/utils/show_bottom_sheet_widget.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:aim/src/presentation/screens/dashboard/analysis/widget/analysis_filter_bottom_sheet.dart';
import 'package:flutter/material.dart';

Future openAnalysisFilterBottomSheet({
  required BuildContext context,
  required double height,
  // required List<Phase> phases,
  // required Phase selectedPhase,
  required List<Year> years,
  required Year selectedYear,
  // required List<ProjectType> sectors,
  // required ProjectType selectedSector,
  // required Function(Phase, ProjectType , Year) onTap,
  required Function(Year) onTap,
}) {
  return showBottomSheetWidget(
    height: height,
    context: context,
    content: AnalysisFilterBottomSheetWidget(
      // phases: phases,
      // selectedPhase: selectedPhase,
      // sectors: sectors,
      // selectedSector: selectedSector,
      years: years,
      selectedYear: selectedYear,
      onTap: onTap,
    ),
  );
}
