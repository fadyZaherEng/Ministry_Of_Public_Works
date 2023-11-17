import 'package:aim/src/config/utils/show_bottom_sheet_widget.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/entities/filter/warranty_type.dart';
import 'package:aim/src/presentation/screens/variation/widgets/variations_filter_bottom_sheet_widget.dart';
import 'package:aim/src/presentation/screens/warranties/widget/warranties_filter_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

Future openVariationsFilterBottomSheet({
  required BuildContext context,
  required double height,
  required List<Status> status,
  required List<ProjectType> projectTypes,
  required Status selectedStatus,
  required Function(Status, Phase,ProjectType,DateTime?, DateTime?) onTap,
  required DateTime? selectedFromDate,
  required DateTime? selectedToDate,
  required List<Phase> phases,
  required Phase selectedPhase,
  required ProjectType selectedProjectType,

}) {
  return showBottomSheetWidget(
    height: height,
    context: context,
    content: VariationsFilterBottomSheetWidget(
      status: status,
      selectedStatus: selectedStatus,
      onTap: onTap,
      selectedFromDate: selectedFromDate,
      selectedToDate: selectedToDate,
      selectedPhase: selectedPhase,
      phases: phases,
      projectTypes: projectTypes,
      selectedProjectType: selectedProjectType,
    ),
  );
}
