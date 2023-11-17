import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/get_phase_color.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/risks/risk.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class RiskListCardWidget extends StatelessWidget {
  final Risk risk;

  const RiskListCardWidget({
    required this.risk,
    Key? key,
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
              title: S.of(context).agreementNumber,
              value: risk.agreementNumber ?? "",
              imagePath: ImagePaths.number,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).sector,
              value: risk.projectSector ?? "",
              imagePath: ImagePaths.sector,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).projectPhase,
              value: risk.projectPhase ?? "",
              color: getPhaseColor(risk.projectPhase ?? ""),
              imagePath: ImagePaths.phase,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).title,
              value: risk.title ?? "",
              imagePath: ImagePaths.status,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildProjectItem(
                  title: S.of(context).severity,
                  value: "⬤",
                  color: severityColor(risk.severity ?? ""),
                  imagePath: ImagePaths.severityRisk,
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
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

  Color severityColor(String severity) {
    if (severity.toLowerCase() == "low" || severity.toLowerCase() == "منخفض") {
      return ColorSchema.barGreen;
    } else if (severity.toLowerCase() == "medium" ||
        severity.toLowerCase() == "متوسط") {
      return Colors.yellow;
    } else if (severity.toLowerCase() == "high" ||
        severity.toLowerCase() == "مرتفع") {
      return ColorSchema.barRed;
    } else {
      return ColorSchema.primary;
    }
  }
}
