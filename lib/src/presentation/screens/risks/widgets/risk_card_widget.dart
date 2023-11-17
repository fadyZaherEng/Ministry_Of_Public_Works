import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/get_phase_color.dart';
import 'package:aim/src/config/utils/get_status_color.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/risks/risk.dart';
import 'package:aim/src/presentation/utils/open_description_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/button_with_widget.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class RiskCardWidget extends StatelessWidget {
  final Risk risk;
  final String languageCode;
  final Function() onDownloadPressed;

  const RiskCardWidget({
    Key? key,
    required this.risk,
    required this.languageCode,
    required this.onDownloadPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: risk.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).title,
              value: risk.title ?? "",
              imagePath: ImagePaths.location,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).projectPhase,
              value: risk.projectPhase ?? "",
              color: getPhaseColor(risk.projectPhase ?? ""),
              imagePath: ImagePaths.phase,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).assignedTo,
              value: risk.assignedTo ?? "",
              imagePath: ImagePaths.assignedTo,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).probability,
              value: _getProbabilityName(risk.probability ?? 0),
              imagePath: ImagePaths.projectEngineer,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).impact,
              value: _getImpactName(risk.impact ?? 0),
              imagePath: ImagePaths.contractAmount,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).severity,
              value: risk.severity ?? "",
              imagePath: ImagePaths.projectEngineer,
              color: _getSeverityColor(risk.severity ?? ""),
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).statusOnly,
              value: risk.status ?? "",
              imagePath: ImagePaths.status,
              color: getStatusColor(risk.status ?? ""),
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).dueDate,
              value: formatDateTimeString(risk.dueDate ?? ""),
              // formatDateBasedOnLanguage(risk.dueDate ?? "", languageCode),
              imagePath: ImagePaths.creationDate,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).sector,
              value: risk.projectSector ?? "",
              imagePath: ImagePaths.sector,
            ),
            secondItem: _buildProjectItem(
                title: S.of(context).riskDescription,
                value: risk.description ?? "",
                imagePath: ImagePaths.creationDate,
                maxLines: 2,
                onPressed: () {
                  openDescriptionBottomSheet(
                    context: context,
                    height: 200,
                    description: risk.description ?? "",
                  );
                }),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: SizedBox()),
              ButtonWithWidget(
                title: S.of(context).attachments,
                imagePath: ImagePaths.downloadReport,
                isSuffixIcon: false,
                onPressed: onDownloadPressed,
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
    required value,
    required String imagePath,
    Color color = ColorSchema.primary,
    Function()? onPressed,
    int maxLines = 20,
  }) {
    return ProjectItemWidget(
      title: title,
      value: value,
      imagePath: imagePath,
      color: color,
      onPressed: onPressed,
      maxLines: maxLines,
    );
  }

  String _getProbabilityName(double value) {
    if (value >= 0 && value <= 40) {
      return S.current.low;
    } else if (value > 40 && value <= 80) {
      return S.current.medium;
    } else {
      return S.current.high;
    }
  }

  String _getImpactName(double value) {
    if (value == 1) {
      return S.current.low;
    } else if (value == 2) {
      return S.current.medium;
    } else if (value == 3) {
      return S.current.high;
    } else {
      return "";
    }
  }

  Color _getSeverityColor(String value) {
    if (value == S.current.low) {
      return ColorSchema.barGreen;
    } else if (value == S.current.medium) {
      return Colors.yellow;
    } else if (value == S.current.high) {
      return ColorSchema.barRed;
    } else {
      return ColorSchema.primary;
    }
  }
}
