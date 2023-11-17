import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/get_phase_color.dart';
import 'package:aim/src/config/utils/get_status_color.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/milestones/milestone.dart';
import 'package:aim/src/presentation/widgets/button_with_widget.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class MilestoneCardWidget extends StatelessWidget {
  final Milestone milestone;
  final Function() onDownloadPressed;

  const MilestoneCardWidget({
    Key? key,
    required this.milestone,
    required this.onDownloadPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: milestone.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).title,
              value: milestone.title ?? "",
              imagePath: ImagePaths.location,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).projectPhase,
              value: milestone.projectPhase ?? "",
              color: getPhaseColor(milestone.projectPhase ?? ""),
              imagePath: ImagePaths.phase,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).plannedFinishDate,
              value: formatDateTimeString(milestone.plannedFinishDate ?? ""),
              imagePath: ImagePaths.plannedDate,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).actualFinishDate,
              value: formatDateTimeString(milestone.actualFinishDate ?? ""),
              imagePath: ImagePaths.actualDate,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).statusOnly,
              value: milestone.status ?? "",
              imagePath: ImagePaths.status,
              color: getStatusColor(milestone.status ?? ""),
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).sector,
              value: milestone.sector ?? "",
              imagePath: ImagePaths.sector,
            ),
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
  }) {
    return ProjectItemWidget(
      title: title,
      value: value,
      imagePath: imagePath,
      color: color,
    );
  }
}
