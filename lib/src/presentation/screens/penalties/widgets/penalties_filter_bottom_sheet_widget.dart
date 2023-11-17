import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/android_date_picker.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/filter/penalty_type.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/entities/filter/warranty_type.dart';
import 'package:aim/src/presentation/widgets/button_widget.dart';
import 'package:aim/src/presentation/widgets/date_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PenaltiesFilterBottomSheetWidget extends StatefulWidget {
  final List<PenaltyType> penaltyTypes;
  final PenaltyType selectedPenaltyType;
  final Function(PenaltyType,ProjectType,Phase, DateTime?, DateTime?) onTap;
  final DateTime? selectedFromDate;
  final DateTime? selectedToDate;
  final List<Phase> phases;
  final Phase selectedPhase;
  final List<ProjectType> projectTypes;
  final ProjectType selectedProjectType;


  const PenaltiesFilterBottomSheetWidget({
    Key? key,
    required this.penaltyTypes,
    required this.selectedPenaltyType,
    required this.onTap,
    required this.selectedFromDate,
    required this.selectedToDate,
    required this.phases,
    required this.selectedPhase,
    required this.projectTypes,
    required this.selectedProjectType,
  }) : super(key: key);

  @override
  State<PenaltiesFilterBottomSheetWidget> createState() =>
      _PenaltiesFilterBottomSheetWidgetState();
}

class _PenaltiesFilterBottomSheetWidgetState
    extends State<PenaltiesFilterBottomSheetWidget> {
  final TextEditingController fromTextEditingController =
      TextEditingController();
  final TextEditingController toTextEditingController = TextEditingController();
  PenaltyType tempPenaltyType = const PenaltyType();
  Phase tempPhase = const Phase();
  ProjectType tempProjectType = const ProjectType();
  DateTime? tempSelectedFromDate;
  DateTime? tempSelectedToDate;

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
          buildSectorSection(context),
          const SizedBox(height: 24),
          buildPenaltyTypesSection(context),
          const SizedBox(height: 24),
          _buildDateSection(context),
          const SizedBox(height: 48),
          ButtonWidget(
            onTap: () {
              widget.onTap(
                tempPenaltyType,
                tempProjectType,
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

  InkWell _buildPenaltyTypeItem(
      BuildContext context, PenaltyType penaltyType) {
    return InkWell(
      onTap: () {
        setState(() {
          if (tempPenaltyType == penaltyType) {
            tempPenaltyType = const PenaltyType();
          } else {
            tempPenaltyType = penaltyType;
          }
        });
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: _selectedBackgroundColor(
              _isPenaltyTypeSelected(penaltyType, tempPenaltyType)),
        ),
        child: Text(
          penaltyType.name ?? "",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              letterSpacing: -0.26,
              color: _selectedTextColor(
                  _isPenaltyTypeSelected(penaltyType, tempPenaltyType))),
        ),
      ),
    );
  }

  Row buildSectorSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(ImagePaths.sector),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).sector),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: widget.projectTypes
                      .map((e) => _buildProjectTypeItem(context, e))
                      .toList(),
                ),
              )
            ],
          ),
        )
      ],
    );
  }


  InkWell _buildProjectTypeItem(BuildContext context, ProjectType projectType) {
    return InkWell(
      onTap: () {
        setState(() {
          if (tempProjectType == projectType) {
            tempProjectType = const ProjectType();
          } else {
            tempProjectType = projectType;
          }
        });
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: _selectedBackgroundColor(
              _isProjectTypeSelected(projectType, tempProjectType)),
        ),
        child: Text(
          projectType.name ?? "",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              letterSpacing: -0.26,
              color: _selectedTextColor(
                  _isProjectTypeSelected(projectType, tempProjectType))),
        ),
      ),
    );
  }


  Column _buildDateSection(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(ImagePaths.creationDate),
            const SizedBox(width: 16),
            Text(
              S.of(context).penaltiesDate,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    letterSpacing: -0.26,
                  ),
            ),
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
      hint: S.of(context).to,
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
      hint: S.of(context).from,
    );
  }

  Row buildPenaltyTypesSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(ImagePaths.penaltyType),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).penaltiesType),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: widget.penaltyTypes
                      .map((e) => _buildPenaltyTypeItem(context, e))
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
    tempProjectType = widget.selectedProjectType;
    tempPhase = widget.selectedPhase;
    tempPenaltyType = widget.selectedPenaltyType;
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
  bool _isPhaseSelected(Phase phase, Phase selectedPhase) {
    return phase.id == selectedPhase.id;
  }

  bool _isPenaltyTypeSelected(
      PenaltyType penaltyType, PenaltyType selectedPenaltyType) {
    return penaltyType.id == selectedPenaltyType.id;
  }

  bool _isProjectTypeSelected(
      ProjectType projectType, ProjectType selectedProjectType) {
    return projectType.id == selectedProjectType.id;
  }
}
