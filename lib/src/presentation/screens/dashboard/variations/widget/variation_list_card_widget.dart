import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/get_phase_color.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/variations/variation.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class VariationListCardWidget extends StatelessWidget {
  final Variation variation;

  const VariationListCardWidget({
    required this.variation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: variation.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).agreementNumber,
              value: variation.agreementNumber ?? "",
              imagePath: ImagePaths.number,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).TotalVO,
              value: "${variation.variation} ${S.of(context).currency}",
              imagePath: ImagePaths.sector,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).contractAmount,
              value:
                  "${"${variation.contractAmount ?? 0.0}"} ${S.of(context).currency}",
              imagePath: ImagePaths.amount,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).phase,
              value: variation.projectPhase ?? "",
              color: getPhaseColor(variation.projectPhase ?? ""),
              imagePath: ImagePaths.phase,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).variationOrderKPI,
              value: "⬤",
              color: getKPIColor(variation.variationKPI ?? 0.0),
              imagePath: ImagePaths.kpi,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).sector,
              value: variation.sector ?? "",
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

  Color getKPIColor(double kpi) {
    if (kpi.abs() <= 5.0) {
      return ColorSchema.barGreen;
    } else if (kpi.abs() > 5.0 && kpi.abs() < 10.0) {
      return Colors.yellow;
    } else if (kpi.abs() >= 10.0) {
      return ColorSchema.red;
    } else {
      return ColorSchema.primary;
    }
  }
}
