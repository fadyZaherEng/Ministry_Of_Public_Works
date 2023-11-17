import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/get_phase_color.dart';
import 'package:aim/src/config/utils/get_priority_color.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class IssueListCardWidget extends StatelessWidget {
  final Issue issue;

  const IssueListCardWidget({
    required this.issue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: issue.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).agreementNumber,
              value: issue.agreementNumber ?? "",
              imagePath: ImagePaths.number,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).sector,
              value: issue.projectSector ?? "",
              imagePath: ImagePaths.sector,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).projectPhase,
              value: issue.projectPhase ?? "",
              color: getPhaseColor(issue.projectPhase ?? ""),
              imagePath: ImagePaths.phase,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).title,
              value: issue.title ?? "",
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
                  title: S.of(context).priority,
                  // value: priorityName(issue.priority ?? 0.0),
                  value: "⬤",
                  color: priorityColor(issue.priority ?? 0.0),
                  imagePath: ImagePaths.priority,
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
}
