import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/android_date_picker.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/warranty_type.dart';
import 'package:aim/src/presentation/widgets/button_widget.dart';
import 'package:aim/src/presentation/widgets/date_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WarrantiesFilterBottomSheetWidget extends StatefulWidget {
  final List<WarrantyType> warrantyTypes;
  final WarrantyType selectedWarrantyType;
  final Function(WarrantyType, Phase, DateTime?, DateTime?) onTap;
  final DateTime? selectedFromDate;
  final DateTime? selectedToDate;
  final Phase selectedPhase;
  final List<Phase> phases;

  const WarrantiesFilterBottomSheetWidget({
    Key? key,
    required this.warrantyTypes,
    required this.selectedWarrantyType,
    required this.onTap,
    required this.selectedFromDate,
    required this.selectedToDate,
    required this.phases,
    required this.selectedPhase,
  }) : super(key: key);

  @override
  State<WarrantiesFilterBottomSheetWidget> createState() =>
      _WarrantiesFilterBottomSheetWidgetState();
}

class _WarrantiesFilterBottomSheetWidgetState
    extends State<WarrantiesFilterBottomSheetWidget> {
  final TextEditingController fromTextEditingController =
      TextEditingController();
  final TextEditingController toTextEditingController = TextEditingController();
  WarrantyType tempWarrantyType = const WarrantyType();
  DateTime? tempSelectedFromDate;
  DateTime? tempSelectedToDate;
  Phase tempPhase = const Phase();

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return buildContentWidget(context);
  }

  //Helper Widgets//
  SingleChildScrollView buildContentWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildPhasesSection(context),
          const SizedBox(height: 24),
          buildWarrantyTypesSection(context),
          const SizedBox(height: 24),
          _buildDateSection(context),
          const SizedBox(height: 48),
          ButtonWidget(
            onTap: () {
              widget.onTap(
                tempWarrantyType,
                tempPhase,
                tempSelectedFromDate,
                tempSelectedToDate,
              );
            },
            buttonTitle: S.of(context).apply,
          )
        ],
      ),
    );
  }

  Row buildPhasesSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(ImagePaths.phase),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(S.of(context).phase),
            const SizedBox(height: 12),
            Row(
              children: widget.phases
                  .map((e) => _buildPhaseItem(context, e))
                  .toList(),
            ),
          ],
        )
      ],
    );
  }

  InkWell _buildPhaseItem(BuildContext context, Phase phase) {
    return InkWell(
      onTap: () {
        setState(() {
          if (tempPhase == phase) {
            tempPhase = const Phase();
          } else {
            tempPhase = phase;
          }
        });
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: _selectedBackgroundColor(_isPhaseSelected(phase, tempPhase)),
        ),
        child: Text(
          phase.name ?? "",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              letterSpacing: -0.26,
              color: _selectedTextColor(_isPhaseSelected(phase, tempPhase))),
        ),
      ),
    );
  }

  InkWell _buildWarrantyTypeItem(
      BuildContext context, WarrantyType warrantyType) {
    return InkWell(
      onTap: () {
        setState(() {
          if (tempWarrantyType == warrantyType) {
            tempWarrantyType = const WarrantyType();
          } else {
            tempWarrantyType = warrantyType;
          }
        });
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: _selectedBackgroundColor(
              _isWarrantyTypeSelected(warrantyType, tempWarrantyType)),
        ),
        child: Text(
          warrantyType.name ?? "",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              letterSpacing: -0.26,
              color: _selectedTextColor(
                  _isWarrantyTypeSelected(warrantyType, tempWarrantyType))),
        ),
      ),
    );
  }

  Column _buildDateSection(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(ImagePaths.creationDate),
                const SizedBox(width: 16),
                Text(
                  S.of(context).warrantyStartDate,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        letterSpacing: -0.26,
                      ),
                ),
              ],
            ),
            Expanded(child: SizedBox()),
            // Row(
            //   children: [
            //     SvgPicture.asset(ImagePaths.creationDate),
            //     const SizedBox(width: 16),
            //     Text(
            //       // S.of(context).warrantyExpiryDate,
            //       "",
            //       style: Theme.of(context).textTheme.bodyText1?.copyWith(
            //             letterSpacing: -0.26,
            //           ),
            //     ),
            //   ],
            // ),
            SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            buildFromDateSection(context),
            const SizedBox(width: 14),
            buildToDateSection(context),
          ],
        )
      ],
    );
  }

  // Widget _buildDateSection(BuildContext context) {
  //   return Row(
  //     children: [
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             children: [
  //               SvgPicture.asset(ImagePaths.creationDate),
  //               const SizedBox(width: 16),
  //               Text(
  //                 S.of(context).warrantyStartDate,
  //                 style: Theme.of(context).textTheme.bodyText1?.copyWith(
  //                   letterSpacing: -0.26,
  //                 ),
  //               ),
  //             ],
  //           ),
  //           const SizedBox(height: 16),
  //           Container(
  //             width: MediaQuery.of(context).size.width*0.43,
  //             child: buildFromDateSection(context),
  //           ),
  //         ],
  //       ),
  //       // Expanded(child: SizedBox()),
  //       // Column(
  //       //   crossAxisAlignment: CrossAxisAlignment.start,
  //       //   children: [
  //       //     Row(
  //       //       children: [
  //       //         SvgPicture.asset(ImagePaths.creationDate),
  //       //         const SizedBox(width: 16),
  //       //         Text(
  //       //           S.of(context).warrantyExpiryDate,
  //       //           style: Theme.of(context).textTheme.bodyText1?.copyWith(
  //       //             letterSpacing: -0.26,
  //       //           ),
  //       //         ),
  //       //       ],
  //       //     ),
  //       //     const SizedBox(height: 16),
  //       //     Container(
  //       //       width: MediaQuery.of(context).size.width*0.43,
  //       //       child: buildToDateSection(context),
  //       //     ),
  //       //   ],
  //       // ),
  //     ],
  //   );
  // }

  DateTextFieldWidget buildToDateSection(BuildContext context) {
    return DateTextFieldWidget(
      dateTextEditingController: toTextEditingController,
      onTap: () async {
        if (tempSelectedFromDate != null) {
          var chosenToDateTime = await androidDatePicker(
            context: context,
            selectedDate: widget.selectedToDate ?? DateTime.now(),
          );
          tempSelectedToDate = chosenToDateTime;
          if (tempSelectedToDate != null) {
            if (tempSelectedToDate!.compareTo(tempSelectedFromDate!) < 0) {
              print("Can't select to date before from date");
            } else {
              toTextEditingController.text =
                  "${tempSelectedToDate?.day}/${tempSelectedToDate?.month}/${tempSelectedToDate?.year}";
            }
          }
        } else {}
      },
      onTapClearDateButton: () {
        setState(() {
          tempSelectedToDate = null;
          toTextEditingController.clear();
        });
      },
      hint: "",
    );
  }

  DateTextFieldWidget buildFromDateSection(BuildContext context) {
    return DateTextFieldWidget(
      dateTextEditingController: fromTextEditingController,
      onTap: () async {
        var chosenFromDateTime = await androidDatePicker(
          context: context,
          selectedDate: widget.selectedFromDate ?? DateTime.now(),
        );
        tempSelectedFromDate = chosenFromDateTime;
        if (tempSelectedFromDate != null) {
          fromTextEditingController.text =
              "${tempSelectedFromDate?.day}/${tempSelectedFromDate?.month}/${tempSelectedFromDate?.year}";
        }
      },
      onTapClearDateButton: () {
        setState(() {
          tempSelectedFromDate = null;
          fromTextEditingController.clear();
        });
      },
      hint: "",
    );
  }

  Row buildWarrantyTypesSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(ImagePaths.warrantyType),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).warrantyType),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: widget.warrantyTypes
                      .map((e) => _buildWarrantyTypeItem(context, e))
                      .toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  //Helper Functions//
  void _init() {
    tempPhase = widget.selectedPhase;
    tempWarrantyType = widget.selectedWarrantyType;
    tempSelectedFromDate = widget.selectedFromDate;
    tempSelectedToDate = widget.selectedToDate;
    if (tempSelectedFromDate != null) {
      fromTextEditingController.text =
          "${tempSelectedFromDate?.day}/${tempSelectedFromDate?.month}/${tempSelectedFromDate?.year}";
    }
    if (tempSelectedToDate != null) {
      toTextEditingController.text =
          "${tempSelectedToDate?.day}/${tempSelectedToDate?.month}/${tempSelectedToDate?.year}";
    }
  }

  Color _selectedBackgroundColor(bool isSelected) {
    return isSelected == true
        ? ColorSchema.primary
        : ColorSchema.chipBackground.withOpacity(0.08);
  }

  Color _selectedTextColor(bool isSelected) {
    return isSelected == true ? ColorSchema.white : ColorSchema.primary;
  }

  bool _isWarrantyTypeSelected(
      WarrantyType warrantyType, WarrantyType selectedWarrantyType) {
    return warrantyType.id == selectedWarrantyType.id;
  }

  bool _isPhaseSelected(Phase phase, Phase selectedPhase) {
    return phase.id == selectedPhase.id;
  }
}
