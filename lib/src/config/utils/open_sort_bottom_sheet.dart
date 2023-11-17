import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/config/utils/show_bottom_sheet_widget.dart';
import 'package:aim/src/presentation/widgets/sort_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

Future openSortBottomSheet({
  required BuildContext context,
  required List<Sort> sorts,
  required Sort selectedSort,
  required double height,
  required void Function(Sort sort) selectSortEvent,
}) {
  return showBottomSheetWidget(
    height: height,
    context: context,
    content: SortBottomSheetWidget(
      sorts: sorts,
      selectedSort: selectedSort,
    ),
  ).then(
        (value) {
      if (value != null) {
        selectSortEvent(value as Sort);
      }
    },
  );
}