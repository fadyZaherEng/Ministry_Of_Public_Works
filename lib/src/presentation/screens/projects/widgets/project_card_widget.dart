import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/get_phase_color.dart';
import 'package:aim/src/config/utils/get_status_color.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/project/project.dart';
import 'package:aim/src/presentation/widgets/button_with_widget.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class ProjectCardWidget extends StatelessWidget {
  final Project project;
  final Function() onPressed;

  const ProjectCardWidget({
    Key? key,
    required this.project,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: project.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).agreementNumber,
              value: project.agreementNumber ?? "",
              imagePath: ImagePaths.number,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).projectPhase,
              value: project.phaseName ?? "",
              color: getPhaseColor(project.phaseName ?? ""),
              imagePath: ImagePaths.phase,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).endUser,
              value: project.endUser ?? "",
              imagePath: ImagePaths.endUser,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).sector,
              value: project.sector ?? "",
              imagePath: ImagePaths.sector,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).status,
              value: project.statusName ?? "",
              imagePath: ImagePaths.status,
              color: getStatusColor(project.statusName ?? ""),
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).projectEngineer,
              value: project.projectEngineerName ?? "",
              imagePath: ImagePaths.projectEngineer,
            ),
          ),
          const SizedBox(height: 22),
          ButtonWithWidget(
            title: S.of(context).moreDetails,
            imagePath: ImagePaths.arrowRight,
            isSuffixIcon: true,
            onPressed: onPressed,
          )
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
