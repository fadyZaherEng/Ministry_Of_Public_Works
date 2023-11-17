import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/get_phase_color.dart';
import 'package:aim/src/config/utils/get_priority_color.dart';
import 'package:aim/src/config/utils/get_priority_name.dart';
import 'package:aim/src/config/utils/get_status_color.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/presentation/utils/open_description_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/button_with_widget.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class IssueCardWidget extends StatelessWidget {
  final Issue issue;
  final Function() onDownloadPressed;

  const IssueCardWidget({
    Key? key,
    required this.issue,
    required this.onDownloadPressed,
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
              title: S.of(context).title,
              value: issue.title,
              imagePath: ImagePaths.location,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).projectPhase,
              value: issue.projectPhase,
              color: getPhaseColor(issue.projectPhase ?? ""),
              imagePath: ImagePaths.phase,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).priority,
              value: priorityName(issue.priority ?? 0.0),
              color: priorityColor(issue.priority ?? 0.0),
              imagePath: ImagePaths.priority,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).assignedTo,
              value: issue.assignedTo,
              imagePath: ImagePaths.assignedTo,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).statusOnly,
              value: issue.status,
              imagePath: ImagePaths.status,
              color: getStatusColor(issue.status ?? ""),
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).dueDate,
              value: formatDateTimeString(issue.dueDate ?? ""),
              imagePath: ImagePaths.creationDate,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).sector,
              value: issue.projectSector ?? "",
              imagePath: ImagePaths.sector,
            ),
            secondItem: _buildProjectItem(
                title: S.of(context).issueDescription,
                value: issue.description ?? "",
                imagePath: ImagePaths.creationDate,
                maxLines: 2,
                onPressed: () {
                  openDescriptionBottomSheet(
                    context: context,
                    height: 200,
                    description: issue.description ?? "",
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
      value: value ?? "",
      imagePath: imagePath,
      color: color,
      onPressed: onPressed,
      maxLines: maxLines,
    );
  }
}
