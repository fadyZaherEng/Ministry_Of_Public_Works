import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:aim/src/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnalysisFilterBottomSheetWidget extends StatefulWidget {
  // final List<Phase> phases;
  // final List<ProjectType> sectors;
  final List<Year> years;

  // final Phase selectedPhase;
  // final ProjectType selectedSector;
  final Year selectedYear;

  // final Function(Phase, ProjectType , Year) onTap;
  final Function(Year) onTap;

  const AnalysisFilterBottomSheetWidget({
    Key? key,
    // required this.phases,
    // required this.sectors,
    required this.years,
    // required this.selectedPhase,
    // required this.selectedSector,
    required this.selectedYear,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AnalysisFilterBottomSheetWidget> createState() =>
      _DashboardFilterBottomSheetWidgetState();
}

class _DashboardFilterBottomSheetWidgetState
    extends State<AnalysisFilterBottomSheetWidget> {
  // Phase tempPhase = const Phase();
  // ProjectType tempSector = const ProjectType();
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
          // buildPhasesSection(context),
          // const SizedBox(height: 24),
          // buildSectorsSection(context),
          // const SizedBox(height: 24),
          buildYearSection(context),
          const SizedBox(height: 48),
          ButtonWidget(
            onTap: () {
              widget.onTap(
                // tempPhase,
                // tempSector,
                tempYear,
              );
            },
            buttonTitle: S.of(context).apply,
          )
        ],
      ),
    );
  }

  Row buildYearSection(BuildContext context) {
    return Row(
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
              children:
                  widget.years.map((e) => _buildYearItem(context, e)).toList(),
            ),
          ],
        )
      ],
    );
  }

/*
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
*/

/*
  InkWell _buildSectorItem(BuildContext context, ProjectType sector) {
    return InkWell(
      onTap: () {
        setState(() {
          if (tempSector == sector) {
            tempSector = const ProjectType();
          } else {
            tempSector = sector;
          }
        });
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color:
              _selectedBackgroundColor(_isStatusSelected(sector, tempSector)),
        ),
        child: Text(
          sector.name ?? "",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
              letterSpacing: -0.26,
              color: _selectedTextColor(_isStatusSelected(sector, tempSector))),
        ),
      ),
    );
  }
*/

  InkWell _buildYearItem(BuildContext context, Year year) {
    return InkWell(
      onTap: () {
        setState(() {
          if (tempYear == year) {
            tempYear = const Year();
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

/*
  Row buildSectorsSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(ImagePaths.status),
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
                  children: widget.sectors
                      .map((e) => _buildSectorItem(context, e))
                      .toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
*/

/*
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
*/

  //Helper Functions//
  void _init() {
    // tempPhase = widget.selectedPhase;
    // tempSector = widget.selectedSector;
    tempYear = widget.selectedYear;
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

  bool _isStatusSelected(ProjectType sector, ProjectType selectedSector) {
    return sector.id == selectedSector.id;
  }

  bool _isYearSelected(Year year, Year selectedYear) {
    return year.name == selectedYear.name;
  }
}
