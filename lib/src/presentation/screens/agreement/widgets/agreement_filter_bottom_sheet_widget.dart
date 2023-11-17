import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/filter/month.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:aim/src/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AgreementFilterBottomSheetWidget extends StatefulWidget {
  final List<ProjectType> projectTypes;
  final List<Year> years;
  final List<Month> months;
  final Year selectedYear;
  final Month selectedMonth;
  final ProjectType selectedProjectType;
  final Function(ProjectType,Year, Month) onTap;

  const AgreementFilterBottomSheetWidget({
    Key? key,
    required this.onTap,
    required this.projectTypes,
    required this.years,
    required this.months,
    required this.selectedProjectType,
    required this.selectedYear,
    required this.selectedMonth,
  }) : super(key: key);

  @override
  State<AgreementFilterBottomSheetWidget> createState() =>
      _AgreementFilterBottomSheetWidgetState();
}

class _AgreementFilterBottomSheetWidgetState
    extends State<AgreementFilterBottomSheetWidget> {
  final TextEditingController fromTextEditingController =
      TextEditingController();
  final TextEditingController toTextEditingController = TextEditingController();
  ProjectType tempProjectType = const ProjectType();
  Month tempMonth = const Month();
  Year tempYear = const Year();

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
                tempProjectType,
                tempYear,
                tempMonth,
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

  //Helper Functions//
  void _init() {
    tempMonth = widget.selectedMonth;
    tempYear = widget.selectedYear;
    tempProjectType = widget.selectedProjectType;
  }

  Color _selectedBackgroundColor(bool isSelected) {
    return isSelected == true
        ? ColorSchema.primary
        : ColorSchema.chipBackground.withOpacity(0.08);
  }

  Color _selectedTextColor(bool isSelected) {
    return isSelected == true ? ColorSchema.white : ColorSchema.primary;
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
