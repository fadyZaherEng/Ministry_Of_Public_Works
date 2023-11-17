import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/get_phase_color.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/project/project.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class PenaltiesListCardWidget extends StatelessWidget {
  final Project penalty;

  const PenaltiesListCardWidget({
    required this.penalty,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: penalty.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).agreementNumber,
              value: penalty.agreementNumber ?? "",
              imagePath: ImagePaths.number,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).contractAmount,
              value:
                  "${(penalty.contractAmountstr ?? "")} ${S.of(context).currency}",
              imagePath: ImagePaths.amount,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).totalPenalties,
              value: penalty.totalPenaltiesstr ?? "",
              imagePath: ImagePaths.approvalDate,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).projectPhase,
              value: penalty.phaseName ?? "",
              color: getPhaseColor(penalty.phaseName ?? ""),
              imagePath: ImagePaths.phase,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              // title: "Penalties KPI",
              title: S.of(context).indicator,
              value: "⬤",
              color: getKPIColor(
                  penalty.phaseName ?? "", penalty.penaltiesKPI ?? 0.0),
              imagePath: ImagePaths.kpi,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).sector,
              value: penalty.sector ?? "",
              imagePath: ImagePaths.sector,
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

  Color getKPIColor(String phaseName, double kpi) {
    if (phaseName.trim() == "Execution" || phaseName.trim() == "التنفيذ") {
      if (kpi == 0) {
        return ColorSchema.barGreen;
      } else if (kpi < 20.0) {
        return Colors.yellow;
      } else {
        return ColorSchema.barRed;
      }
    } else if (phaseName.trim() == "Design" || phaseName.trim() == "التصميم") {
      if (kpi == 0) {
        return ColorSchema.barGreen;
      } else if (kpi < 10) {
        return Colors.yellow;
      } else {
        return ColorSchema.barRed;
      }
    } else {
      return ColorSchema.primary;
    }
  }
}
