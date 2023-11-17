import 'package:aim/src/config/utils/show_bottom_sheet_widget.dart';
import 'package:aim/src/domain/entities/filter/penalty_type.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/presentation/screens/penalties/widgets/penalties_filter_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

Future openPenaltiesFilterBottomSheet({
  required BuildContext context,
  required double height,
  required List<PenaltyType> penaltyTypes,
  required PenaltyType selectedPenaltyType,
  required Function(PenaltyType,ProjectType, Phase, DateTime?, DateTime?) onTap,
  required DateTime? selectedFromDate,
  required DateTime? selectedToDate,
  required List<Phase> phases,
  required Phase selectedPhase,
  required List<ProjectType> projectTypes,
  required ProjectType selectedProjectType,
}) {
  return showBottomSheetWidget(
    height: height,
    context: context,
    content: PenaltiesFilterBottomSheetWidget(
      penaltyTypes: penaltyTypes,
      selectedPenaltyType: selectedPenaltyType,
      onTap: onTap,
      selectedFromDate: selectedFromDate,
      selectedToDate: selectedToDate,
      phases: phases,
      selectedPhase: selectedPhase,
      projectTypes: projectTypes,
      selectedProjectType: selectedProjectType,
    ),
  );
}
