import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/design/design.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class DesignListCardWidget extends StatelessWidget {
  final Design design;

  const DesignListCardWidget({
    required this.design,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: design.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).agreementNumber,
              value: design.agreementNumber ?? "",
              imagePath: ImagePaths.number,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).planningPlanned,
              value: "${design.planningPlanned ?? 0.0}",
              imagePath: ImagePaths.plannedDate,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).planningActual,
              value: "${design.planningActual ?? 0.0}",
              imagePath: ImagePaths.actualDate,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).designTenderingPlanned,
              value: "${design.designTenderingPlanned ?? 0.0}",
              imagePath: ImagePaths.designPlanned,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).designTenderingActual,
              value: "${design.designTenderingActual ?? 0.0}",
              imagePath: ImagePaths.designActual,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).dataCollectingPlanned,
              value: "${design.dataCollectingPlanned ?? 0.0}",
              imagePath: ImagePaths.dataPlanned,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).dataCollectingActual,
              value: "${design.dataCollectingActual ?? 0.0}",
              imagePath: ImagePaths.dataActual,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).conceptDesignPlanned,
              value: "${design.conceptDesignPlanned ?? 0.0}",
              imagePath: ImagePaths.conceptPlanned,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).conceptDesignActual,
              value: "${design.conceptDesignActual ?? 0.0}",
              imagePath: ImagePaths.conceptActual,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).designDevelopmentPlanned,
              value: "${design.designDevelopmentPlanned ?? 0.0}",
              imagePath: ImagePaths.developmentPlanned,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).designDevelopmentActual,
              value: "${design.designDevelopmentActual ?? 0.0}",
              imagePath: ImagePaths.developmentActual,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).preliminaryDesignPlanned,
              value: "${design.preliminaryDesignPlanned ?? 0.0}",
              imagePath: ImagePaths.perliminaryPlanned,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).preliminaryDesignActual,
              value: "${design.preliminaryDesignActual ?? 0.0}",
              imagePath: ImagePaths.perliminaryActual,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).finalDesignPlanned,
              value: "${design.finalDesignPlanned ?? 0.0}",
              imagePath: ImagePaths.finalDesignPlanning,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).finalDesignActual,
              value: "${design.finalDesignActual ?? 0.0}",
              imagePath: ImagePaths.finalDesignActual,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).constructionTenderPlanned,
              value: "${design.constructionTenderPlanned ?? 0.0}",
              imagePath: ImagePaths.constructionPlanning,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).constructionTenderActual,
              value: "${design.constructionTenderActual ?? 0.0}",
              imagePath: ImagePaths.constructionActual,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).designKPI,
              value: "⬤",
              color: getKpiColor(design.designKPI ?? 0.0),
              imagePath: ImagePaths.designKPI,
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

  Color getKpiColor(double value) {
    if (value <= 120) return Colors.yellow;
    return ColorSchema.red;
  }
}
