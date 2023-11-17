import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/get_phase_color.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/variations/variation.dart';
import 'package:aim/src/presentation/utils/open_description_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/button_with_widget.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class VariationCardWidget extends StatelessWidget {
  final Variation variation;
  final Function() onDownloadPressed;

  const VariationCardWidget({
    Key? key,
    required this.variation,
    required this.onDownloadPressed,
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
              value: variation.agreementNumber,
              imagePath: ImagePaths.number,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).projectEng,
              value: variation.projectEngineer,
              imagePath: ImagePaths.projectEngineer,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).sector,
              value: variation.sector,
              imagePath: ImagePaths.sector,
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
              title: S.of(context).userWhoAskedForVariationOrder,
              value: variation.userWhoAskedForVariationOrderstr ?? "",
              imagePath: ImagePaths.value,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).impactOnCost,
              value: variation.impactOnCost,
              imagePath: ImagePaths.impactVariation,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).variationValue,
              value:
                  "${"${variation.variationValueStr}"} ${S.of(context).currency}",
              imagePath: ImagePaths.value,
              color: ColorSchema.orange,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).date,
              value: formatDateTimeString(variation.date ?? ""),
              imagePath: ImagePaths.creationDate,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
            child: _buildProjectItem(
                title: S.of(context).variationOrderJustification,
                value: variation.justification ?? "",
                imagePath: ImagePaths.value,
                maxLines: 2,
                onPressed: () {
                  openDescriptionBottomSheet(
                    context: context,
                    height: 200,
                    description: variation.justification ?? "",
                  );
                }),
          ),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: ButtonWithWidget(
              title: S.of(context).attachments,
              imagePath: ImagePaths.downloadReport,
              isSuffixIcon: false,
              onPressed: onDownloadPressed,
            ),
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
    Function()? onPressed,
    int maxLines = 20,
    Color color = ColorSchema.primary,
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
