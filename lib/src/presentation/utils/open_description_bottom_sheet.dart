import 'package:aim/src/config/utils/show_bottom_sheet_widget.dart';
import 'package:aim/src/presentation/widgets/description_bottom_sheet.dart';
import 'package:flutter/material.dart';

Future openDescriptionBottomSheet({
  required BuildContext context,
  required double height,
  required String description,
}) {
  return showBottomSheetWidget(
    height: MediaQuery.of(context).size.height * 0.65,
    context: context,
    content: DescriptionBottomSheet(
      description: description,
    ),
  );
}
