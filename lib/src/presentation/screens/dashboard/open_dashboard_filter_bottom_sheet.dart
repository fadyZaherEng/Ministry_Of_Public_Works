import 'package:aim/src/config/utils/show_bottom_sheet_widget.dart';
import 'package:aim/src/domain/entities/dashboards/indicator.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/presentation/screens/dashboard/dashboard_filter_bottom_sheet.dart';
import 'package:aim/src/presentation/screens/projects/widgets/projects_filter_bottom_sheet_widget.dart';
import 'package:aim/src/presentation/screens/risks/widgets/risks_filter_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

Future openDashboardFilterBottomSheet({
  required BuildContext context,
  required double height,
  required List<Phase> phases,
  required Phase selectedPhase,
  required List<ProjectType> sectors,
  required ProjectType selectedSector,
  Indicator selectedIndicator = const Indicator(id: 0, name: ""),
  List<Indicator> indicators = const  [],
  bool isHavePhase = true,
  bool isHaveIndicator = false,
  required Function(Phase, ProjectType,Indicator) onTap,
}) {
  return showBottomSheetWidget(
    height: isHavePhase ? height : 220,
    context: context,
    content: DashboardFilterBottomSheetWidget(
      phases: phases,
      selectedPhase: selectedPhase,
      sectors: sectors,
      selectedSector: selectedSector,
      isHavePhase:isHavePhase,
      indicators:indicators,
      selectedIndicator:selectedIndicator,
      isHaveIndicator:isHaveIndicator,
      onTap: onTap,
    ),
  );
}
