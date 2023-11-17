import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/routes/app_routes.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/get_phase_color.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/overview/overview.dart';
import 'package:aim/src/presentation/screens/dashboard/overview/widget/button_overview_widget.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class OverviewListCardWidget extends StatelessWidget {
  final Overview overview;
  final String permission;

  const OverviewListCardWidget({
    required this.overview,
    required this.permission,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: overview.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).agreementNumber,
              value: overview.agreementNumber ?? "",
              imagePath: ImagePaths.number,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).projectEng,
              value: overview.projectEngineer ?? "",
              imagePath: ImagePaths.projectEngineer,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).contractAmount,
              value:
                  "${overview.contractAmount ?? 0.0} ${S.of(context).currency}",
              imagePath: ImagePaths.amount,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).sector,
              value: overview.sector ?? "",
              imagePath: ImagePaths.sector,
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
                  title: S.of(context).phase,
                  value: overview.phaseName ?? "",
                  color: getPhaseColor(overview.phaseName ?? ""),
                  imagePath: ImagePaths.phase,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: ButtonOverViewWidegt(
                  title: S.of(context).moreDetails,
                  imagePath: ImagePaths.arrowRight,
                  isSuffixIcon: false,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.projectDetails,
                      arguments: overview.id ?? "",
                    );
                  },
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              if (!_validateUserPermission())
                Expanded(
                  flex: 1,
                  child: ButtonOverViewWidegt(
                    title: S.of(context).analysisModule,
                    imagePath: ImagePaths.downloadReport,
                    isSuffixIcon: false,
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.analysisDashboard,
                        arguments: overview.id ?? "",
                      );
                    },
                  ),
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

  bool _validateUserPermission() {
    return permission == "Financial Department" ||
        permission == "Financial Auditors";
  }
}
