import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/extensions.dart';
import 'package:aim/src/config/utils/get_phase_color.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/payments/payment.dart';
import 'package:aim/src/presentation/widgets/button_with_widget.dart';
import 'package:aim/src/presentation/widgets/card_widget.dart';
import 'package:aim/src/presentation/widgets/project_item_widget.dart';
import 'package:flutter/material.dart';

import '../../../../config/utils/date_utils.dart';

class PaymentCardWidget extends StatelessWidget {
  final Payment payment;
  final Function() onDownloadPressed;

  const PaymentCardWidget({
    Key? key,
    required this.payment,
    required this.onDownloadPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      projectName: payment.projectName ?? "",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).title,
              value: payment.title ?? "",
              imagePath: ImagePaths.location,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).projectPhase,
              value: payment.phase ?? "",
              color: getPhaseColor(payment.phase ?? ""),
              imagePath: ImagePaths.phase,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).paymentAmount,
              value:
                  "${"${payment.paymentAmount ?? 0}".formatDoubleWithComma()} ${S.of(context).currency}",
              imagePath: ImagePaths.amount,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).paymentDate,
              value: formatDateTimeString(payment.paymentDatestr ?? ""),
              imagePath: ImagePaths.approvalDate,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).plannedPaymentDate, // Erorrr in
              value: formatDateTimeString(payment.plannedPaymentDate ?? ""),
              imagePath: ImagePaths.plannedDate,
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).actualPaymentDate,
              value: formatDateTimeString(payment.actualPaymentDate ?? ""),
              imagePath: ImagePaths.startDate,
            ),
          ),
          const SizedBox(height: 16),
          _buildRowWithPadding(
            firstItem: _buildProjectItem(
              title: S.of(context).statusOnly,
              value: payment.status ?? "",
              imagePath: ImagePaths.status,
              color: getPaymentStatusColor(payment.status ?? ""),
            ),
            secondItem: _buildProjectItem(
              title: S.of(context).sector,
              value: payment.projectSector ?? "",
              imagePath: ImagePaths.sector,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: SizedBox()),
              ButtonWithWidget(
                title: S.of(context).attachedPayment,
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

  Color getPaymentStatusColor(String value) {
    if (value.toLowerCase() == "paid" || value.toLowerCase() == "صرفت") {
      return ColorSchema.barGreen;
    }
    if (value.toLowerCase() == "submitted" || value.toLowerCase() == "مرسلة") {
      return Colors.yellow;
    }

    return Colors.red;
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
