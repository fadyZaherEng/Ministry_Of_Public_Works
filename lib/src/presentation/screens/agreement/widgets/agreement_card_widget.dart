import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/agreement/agreement.dart';
import 'package:aim/src/presentation/widgets/button_with_widget.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class AgreementCardWidget extends StatelessWidget {
  final Agreement agreement;
  final Function() onDownloadPressed;
  final Function() onOpenFormsPressed;

  const AgreementCardWidget({
    Key? key,
    required this.agreement,
    required this.onDownloadPressed,
    required this.onOpenFormsPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: agreement.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).agreementNumber,
              value: agreement.supervisionServiceContractNumber ?? "",
              imagePath: ImagePaths.number,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).sector,
              value: agreement.projectSector ?? "",
              imagePath: ImagePaths.sector,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).projectEng,
              value: agreement.projectEngineerName ?? "",
              imagePath: ImagePaths.projectEngineer,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).month,
              value: "${agreement.month ?? 0}",
              imagePath: ImagePaths.startDate,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16),
                child: _buildProjectItem(
                  title: S.of(context).year,
                  value: "${agreement.year ?? 0}",
                  imagePath: ImagePaths.startDate,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWithWidget(
                title: S.of(context).viewReport,
                imagePath: ImagePaths.downloadReport,
                isSuffixIcon: false,
                onPressed: onOpenFormsPressed,
              ),
              Visibility(
                visible: false,
                child: ButtonWithWidget(
                  title: S.of(context).download,
                  imagePath: ImagePaths.downloadReport,
                  isSuffixIcon: false,
                  onPressed: onDownloadPressed,
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
