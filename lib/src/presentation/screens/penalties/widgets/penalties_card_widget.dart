import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/extensions.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/penalties/penalty.dart';
import 'package:aim/src/presentation/utils/open_description_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/button_with_widget.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class PenaltiesCardWidget extends StatelessWidget {
  final Penalty penalty;
  final Function() onDownloadPressed;

  const PenaltiesCardWidget({
    Key? key,
    required this.penalty,
    required this.onDownloadPressed,
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
              title: S.of(context).projectEngineer,
              value: penalty.projectEngineer ?? "",
              imagePath: ImagePaths.projectEngineer,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).sector,
              value: penalty.projectSector ?? "",
              imagePath: ImagePaths.sector,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).phase,
              value: penalty.phaseName ?? "",
              imagePath: ImagePaths.phase,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).contractor,
              value: penalty.contractor ?? "",
              imagePath: ImagePaths.contractor,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).penaltiesType,
              value: penalty.type ?? "",
              imagePath: ImagePaths.penaltyType,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
                title: S.of(context).penaltiesAmount,
                value:
                    "${"${penalty.amount ?? 0}".formatDoubleWithComma()} ${S.of(context).currency}",
                imagePath: ImagePaths.amount,
                color: ColorSchema.orange),
            secondItem: _buildProjectItem(
              title: S.of(context).penaltiesDate,
              value: formatDateTimeString(penalty.date ?? ""),
              imagePath: ImagePaths.creationDate,
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildProjectItem(
                title: S.of(context).penaltiesDescription,
                value: penalty.penaltiesDescription ?? "",
                imagePath: ImagePaths.creationDate,
                maxLines: 2,
                onPressed: () {
                  openDescriptionBottomSheet(
                    context: context,
                    height: 200,
                    description: penalty.penaltiesDescription ?? "",
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
    Color color = ColorSchema.primary,
    Function()? onPressed,
    int maxLines = 20,
  }) {
    return ProjectItemWidget(
      title: title,
      value: value,
      imagePath: imagePath,
      color: color,
      onPressed: onPressed,
      maxLines: maxLines,
    );
  }
}
