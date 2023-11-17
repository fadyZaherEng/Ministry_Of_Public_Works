import 'package:aim/src/config/utils/show_bottom_sheet_widget.dart';
import 'package:aim/src/domain/entities/filter/month.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:aim/src/presentation/screens/agreement/widgets/agreement_filter_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

Future openAgreementFilterBottomSheet({
  required BuildContext context,
  required double height,
  required List<ProjectType> projectTypes,
  required ProjectType selectedProjectType,
  required List<Year> years,
  required List<Month> months,
  required Function(ProjectType,Year, Month) onTap,
  required Year selectedYear,
  required Month selectedMonth,
}) {
  return showBottomSheetWidget(
    height: height,
    context: context,
    content: AgreementFilterBottomSheetWidget(
      onTap: onTap,
      projectTypes: projectTypes,
      years: years,
      months: months,
      selectedProjectType: selectedProjectType,
      selectedYear: selectedYear,
      selectedMonth: selectedMonth,
    ),
  );
}
