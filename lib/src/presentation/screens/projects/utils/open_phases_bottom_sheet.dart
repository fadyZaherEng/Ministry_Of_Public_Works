import 'package:aim/src/config/utils/show_bottom_sheet_widget.dart';
import 'package:aim/src/domain/entities/project/details_phase.dart';
import 'package:aim/src/domain/entities/project/project_details.dart';
import 'package:aim/src/presentation/screens/projects/details/widgets/phases_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

Future openPhasesBottomSheet({
  required BuildContext context,
  required List<DetailsPhase> phases,
  required double height,
  required void Function(String id) selectIdEvent,

}) {
  return showBottomSheetWidget(
    height: height,
    context: context,
    content: PhasesBottomSheetWidget(
      phases: phases,
    ),
  ).then(
    (value) {
      if (value != null) {
        selectIdEvent(value['selectedId'] as String);
      }
    },
  );
}
