import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/filter/month.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:aim/src/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReportsFilterBottomSheetWidget extends StatefulWidget {
  final List<Phase> phases;
  final List<ProjectType> projectTypes;
  final List<Month> months;
  final List<Year> years;
  final Phase selectedPhase;
  final ProjectType selectedProjectType;
  final Month selectedMonth;
  final Year selectedYear;
  final Function(Phase, ProjectType,Month, Year) onTap;

  const ReportsFilterBottomSheetWidget({
    Key? key,
    required this.phases,
    required this.projectTypes,
    required this.months,
    required this.years,
    required this.selectedPhase,
    required this.selectedProjectType,
    required this.selectedMonth,
    required this.selectedYear,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ReportsFilterBottomSheetWidget> createState() =>
      _ReportsFilterBottomSheetWidgetState();
}

class _ReportsFilterBottomSheetWidgetState
    extends State<ReportsFilterBottomSheetWidget> {
  Phase tempPhase = const Phase();
  ProjectType tempProjectType = const ProjectType();
  Month tempMonth = const Month();
  Year tempYear = const Year();

  @override
  void initState() {
    super.initState();
    tempPhase = widget.selectedPhase;
    tempMonth = widget.selectedMonth;
    tempYear = widget.selectedYear;
    tempProjectType = widget.selectedProjectType;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
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
          ),
          const SizedBox(height: 24),
          buildSectorSection(context),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(ImagePaths.creationDate),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).year),
                  const SizedBox(height: 12),
                  Row(
                    children: widget.years
                        .map((e) => _buildYearItem(context, e))
                        .toList(),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(ImagePaths.creationDate),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).month),
                    const SizedBox(height: 12),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: widget.months
                            .map((e) => _buildMonthItem(context, e))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 48),
          ButtonWidget(
            onTap: () {
              widget.onTap(
                tempPhase,
                tempProjectType,
                tempMonth,
                tempYear,
              );
            },
            buttonTitle: S.of(context).apply,
          )
        ],
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


  Color _selectedBackgroundColor(bool isSelected) {
    return isSelected == true
        ? ColorSchema.primary
        : ColorSchema.chipBackground.withOpacity(0.08);
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

  InkWell _buildMonthItem(BuildContext context, Month month) {
    return InkWell(
      onTap: () {
        setState(() {
          if (tempMonth == month) {
            // tempMonth = const Month();
          } else {
            tempMonth = month;
          }
        });
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: _selectedBackgroundColor(_isMonthSelected(month, tempMonth)),
        ),
        child: Text(
          month.name ?? "",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              letterSpacing: -0.26,
              color: _selectedTextColor(_isMonthSelected(month, tempMonth))),
        ),
      ),
    );
  }

  InkWell _buildYearItem(BuildContext context, Year year) {
    return InkWell(
      onTap: () {
        setState(() {
          if (tempYear == year) {
            // tempYear = const Year();
          } else {
            tempYear = year;
          }
        });
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: _selectedBackgroundColor(_isYearSelected(year, tempYear)),
        ),
        child: Text(
          year.name ?? "",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              letterSpacing: -0.26,
              color: _selectedTextColor(_isYearSelected(year, tempYear))),
        ),
      ),
    );
  }

  Color _selectedTextColor(bool isSelected) {
    return isSelected == true ? ColorSchema.white : ColorSchema.primary;
  }

  bool _isPhaseSelected(Phase phase, Phase selectedPhase) {
    return phase.id == selectedPhase.id;
  }

  bool _isMonthSelected(Month month, Month selectedMonth) {
    return month.name == selectedMonth.name;
  }

  bool _isYearSelected(Year year, Year selectedYear) {
    return year.name == selectedYear.name;
  }

  bool _isProjectTypeSelected(
      ProjectType projectType, ProjectType selectedProjectType) {
    return projectType.id == selectedProjectType.id;
  }
}
