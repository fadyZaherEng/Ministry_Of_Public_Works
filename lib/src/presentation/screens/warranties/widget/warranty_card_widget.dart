import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/date_utils.dart';
import 'package:aim/src/config/utils/extensions.dart';
import 'package:aim/src/config/utils/get_phase_color.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/warranties/warranty.dart';
import 'package:aim/src/presentation/utils/open_description_bottom_sheet.dart';
import 'package:aim/src/presentation/widgets/button_with_widget.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class WarrantyCardWidget extends StatelessWidget {
  final Warranty warranty;
  final Function() onDownloadPressed;

  const WarrantyCardWidget({
    Key? key,
    required this.warranty,
    required this.onDownloadPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: warranty.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).agreementNumber,
              value: warranty.agreementNumber ?? "",
              imagePath: ImagePaths.number,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).sector,
              value: warranty.sector ?? "",
              imagePath: ImagePaths.sector,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).projectPhase,
              value: warranty.phase ?? "",
              color: getPhaseColor(warranty.phase ?? ""),
              imagePath: ImagePaths.phase,
            ),
            secondItem: _buildProjectItem(
                title: S.of(context).warrantyDescription,
                value: warranty.warrantyDescription ?? "",
                imagePath: ImagePaths.startDate,
                maxLines: 2,
                onPressed: () {
                  openDescriptionBottomSheet(
                    context: context,
                    height: 200,
                    description: warranty.warrantyDescription ?? "",
                  );
                }),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).warrantyType,
              value: warranty.warrantyType ?? "",
              color: ColorSchema.orange,
              imagePath: ImagePaths.phase,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).warrantyAmount,
              value:
                  "${"${warranty.warrantyAmount ?? 0.0}".formatDoubleWithComma()} ${S.of(context).currency}",
              imagePath: ImagePaths.amount,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).warrantyStartDate,
              value: formatDateTimeString(warranty.startDate ?? ""),
              imagePath: ImagePaths.startDate,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).warrantyExpiryDate,
              value: formatDateTimeString(warranty.endDate ?? ""),
              imagePath: ImagePaths.endDate,
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
