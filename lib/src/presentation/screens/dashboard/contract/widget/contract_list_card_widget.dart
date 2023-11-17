import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/contract/contract.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

class ContractListCardWidget extends StatelessWidget {
  final Contract contract;

  const ContractListCardWidget({
    required this.contract,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: contract.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).agreementNumber,
              value: contract.agreementNumber ?? "",
              imagePath: ImagePaths.number,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).scheduleApproval,
              value: "⬤",
              color: getApprovedColor(contract.approved ?? ""),
              imagePath: ImagePaths.status,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).operationAndMaintenanceContract,
              value: _getOperationAndMaintenanceContractIndicator(
                  contract.operationandMaintenanceContract ?? ""),
              imagePath: ImagePaths.creationDate,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).delay,
              value: "⬤",
              color: getDelayColor(contract.delay ?? ""),
              imagePath: ImagePaths.sector,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).variancePercentageElapsedExchange,
              value: (contract.variancePercentage ?? "").isEmpty ? "" : "⬤",
              color: getVariationColor(contract.variancePercentage ?? ""),
              imagePath: ImagePaths.amount,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).sector,
              value: contract.sector ?? "",
              imagePath: ImagePaths.sector,
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

  Color getDelayColor(String delay) {
    if (delay.isEmpty) return ColorSchema.primary;

    double value = double.parse(delay);
    if (value <= 3) {
      return ColorSchema.barGreen;
    }
    if (value > 3 && value <= 20) {
      return Colors.yellow;
    }
    return ColorSchema.red;
  }

  Color getApprovedColor(String approved) {
    if (approved.isEmpty) return ColorSchema.primary;
    if (approved.toLowerCase() == "yes") return ColorSchema.barGreen;
    return ColorSchema.red;
  }

  Color getVariationColor(String variationValue) {
    if (variationValue.isEmpty) return ColorSchema.primary;

    double value = double.parse(variationValue);

    if (value <= 15) {
      return ColorSchema.barGreen;
    }

    if (value > 15 && value <= 30) {
      return Colors.yellow;
    }

    return Colors.red;
  }

  String _getOperationAndMaintenanceContractIndicator(String value) {
    if (value.isEmpty) return "";
    if (value.toLowerCase() == "yes" || value.toLowerCase() == "نعم") {
      return "✔";
    }
    return "✘";
  }
}
