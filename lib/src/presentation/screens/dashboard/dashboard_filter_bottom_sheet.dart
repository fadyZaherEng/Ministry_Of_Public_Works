import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/dashboards/indicator.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/presentation/widgets/button_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardFilterBottomSheetWidget extends StatefulWidget {
  final List<Phase> phases;
  final List<ProjectType> sectors;
  final Phase selectedPhase;
  final ProjectType selectedSector;
  final bool isHavePhase;
  final bool isHaveIndicator;
  final List<Indicator> indicators;
  final Indicator selectedIndicator;

  final Function(Phase, ProjectType,Indicator) onTap;

  const DashboardFilterBottomSheetWidget({
    Key? key,
    required this.phases,
    required this.sectors,
    required this.selectedPhase,
    required this.selectedSector,
    required this.isHavePhase,
    required this.indicators,
    required this.selectedIndicator,
    required this.isHaveIndicator,
    required this.onTap,
  }) : super(key: key);

  @override
  State<DashboardFilterBottomSheetWidget> createState() =>
      _DashboardFilterBottomSheetWidgetState();
}

class _DashboardFilterBottomSheetWidgetState
    extends State<DashboardFilterBottomSheetWidget> {
  Phase tempPhase = const Phase();
  ProjectType tempSector = const ProjectType();
  Indicator tempIndicator = const Indicator();

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
          if (widget.isHavePhase) buildPhasesSection(context),
          if (widget.isHavePhase) const SizedBox(height: 24),
          buildSectorsSection(context),
          if (widget.isHaveIndicator) const SizedBox(height: 24),
          if (widget.isHaveIndicator) buildIndicatorsSection(context),
          const SizedBox(height: 48),
          ButtonWidget(
            onTap: () {
              widget.onTap(
                tempPhase,
                tempSector,
                tempIndicator,
              );
            },
            buttonTitle: S.of(context).apply,
          )
        ],
      ),
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

  InkWell _buildIndicatorItem(BuildContext context, Indicator indicator) {
    return InkWell(
      onTap: () {
        setState(() {
          if (tempIndicator == indicator) {
            tempIndicator = const Indicator();
          } else {
            tempIndicator = indicator;
          }
        });
      },
      child: Container(
        margin: const EdgeInsetsDirectional.only(end: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: _selectedBackgroundColor(_isIndicatorSelected(indicator,tempIndicator))),
        child: Text(
          "⬤",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              ?.copyWith(letterSpacing: -0.26, color: indicator.color, fontSize: 20),
        ),
      ),
    );
  }

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

  Row buildIndicatorsSection(BuildContext context) {
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
              Text(S.of(context).indicator),
              const SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: widget.indicators
                        .map((e) => _buildIndicatorItem(context, e))
                        .toList()),
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
    tempSector = widget.selectedSector;
    tempIndicator = widget.selectedIndicator;
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

  bool _isIndicatorSelected(Indicator indicator, Indicator selectedIndicator) {
    return indicator.id == selectedIndicator.id;
  }
}
