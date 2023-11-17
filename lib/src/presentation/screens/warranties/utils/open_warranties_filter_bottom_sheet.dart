import 'package:aim/src/config/utils/show_bottom_sheet_widget.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/warranty_type.dart';
import 'package:aim/src/presentation/screens/warranties/widget/warranties_filter_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';

Future openWarrantiesFilterBottomSheet({
  required BuildContext context,
  required double height,
  required List<WarrantyType> warrantyTypes,
  required WarrantyType selectedWarrantyTypes,
  required Function(WarrantyType,Phase, DateTime?, DateTime?) onTap,
  required DateTime? selectedFromDate,
  required DateTime? selectedToDate,
  required List<Phase> phases,
  required Phase selectedPhase,
}) {
  return showBottomSheetWidget(
    height: height,
    context: context,
    content: WarrantiesFilterBottomSheetWidget(
      warrantyTypes: warrantyTypes,
      selectedWarrantyType: selectedWarrantyTypes,
      onTap: onTap,
      selectedFromDate: selectedFromDate,
      selectedToDate: selectedToDate,
      selectedPhase: selectedPhase,
      phases: phases,
    ),
  );
}
