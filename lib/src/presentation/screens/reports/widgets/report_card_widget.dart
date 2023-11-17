import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/get_phase_color.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/reports/report.dart';
import 'package:aim/src/presentation/widgets/button_with_widget.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class ReportCardWidget extends StatelessWidget {
  final Report report;
  final Function() onOpenReportPressed;
  final Function() onViewFormPresses;

  const ReportCardWidget({
    Key? key,
    required this.report,
    required this.onOpenReportPressed,
    required this.onViewFormPresses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: report.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).agreementNumber,
              value: report.contractNumber ?? "",
              imagePath: ImagePaths.number,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).projectPhase,
              value: report.phaseName ?? "",
              color: getPhaseColor(report.phaseName ?? ""),
              imagePath: ImagePaths.phase,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).sector,
              value: report.projectSector ?? "",
              imagePath: ImagePaths.sector,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).projectEngineer,
              value: report.projectEngineerName ?? "",
              imagePath: ImagePaths.projectEngineer,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).year,
              value: report.year ?? "",
              imagePath: ImagePaths.startDate,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).month,
              value: report.month ?? "",
              imagePath: ImagePaths.startDate,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 16,
                ),
                child: _buildProjectItem(
                  title: S.of(context).creationDate,
                  value: formatDateTimeString(report.creationDatestr ?? ""),
                  imagePath: ImagePaths.creationDate,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWithWidget(
                title: S.of(context).viewReport,
                imagePath: ImagePaths.downloadReport,
                isSuffixIcon: false,
                onPressed: onViewFormPresses,
              ),
              ButtonWithWidget(
                title: S.of(context).download,
                imagePath: ImagePaths.downloadReport,
                isSuffixIcon: false,
                onPressed: onOpenReportPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding _buildRowWithPadding({
    required ProjectItemWidget firstItem,
    required ProjectItemWidget secondItem,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: firstItem),
          const SizedBox(
            width: 5,
          ),
          Expanded(child: secondItem),
        ],
      ),
    );
  }

  ProjectItemWidget _buildProjectItem({
    required String title,
    required String value,
    required String imagePath,
    Color color = ColorSchema.primary,
  }) {
    return ProjectItemWidget(
      title: title,
      value: value,
      imagePath: imagePath,
      color: color,
    );
  }
}
