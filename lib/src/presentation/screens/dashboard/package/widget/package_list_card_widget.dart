import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/package/package.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class PackageListCardWidget extends StatelessWidget {
  final Package package;

  const PackageListCardWidget({
    Key? key,
    required this.package,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: package.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).agreementNumber,
              value: package.agreementNumber ?? "",
              imagePath: ImagePaths.number,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).finalHandoverCertification,
              value: _getYesOrNoIndicator(
                  package.finalHandOverCertificationstr ?? ""),
              imagePath: ImagePaths.status,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).finalPayment,
              value: _getYesOrNoIndicator(package.finalPaymentIssuedstr ?? ""),
              imagePath: ImagePaths.status,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).initialHandoverCertification,
              value: _getYesOrNoIndicator(
                  package.initialHandOverCertificationstr ?? ""),
              imagePath: ImagePaths.amount,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).finalInsuranceRelease,
              value:
                  _getYesOrNoIndicator(package.finalInsuranceReleasedstr ?? ""),
              imagePath: ImagePaths.initial,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).releaseReservedWarranty,
              value: _getYesOrNoIndicator(
                  package.releasedReservedWarrantystr ?? ""),
              imagePath: ImagePaths.insurance,
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
                  title: S.of(context).fpKPI,
                  value: "⬤",
                  color: getKPIColor(package.pbkpi ?? 0),
                  imagePath: ImagePaths.kpi,
                ),
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

  Color getKPIColor(int kpi) {
    if (kpi == 1) {
      return ColorSchema.barGreen;
    } else if (kpi == 2) {
      return Colors.yellow;
    } else if (kpi == 3) {
      return ColorSchema.barRed;
    } else {
      return ColorSchema.primary;
    }
  }

  String _getYesOrNoIndicator(String value) {
    if (value.isEmpty) return "";
    if (value.toLowerCase() == "yes" || value.toLowerCase() == "نعم")
      return "✔";
    return "✘";
  }
}
