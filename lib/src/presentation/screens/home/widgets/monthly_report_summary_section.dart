import 'package:aim/generated/l10n.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/domain/entities/home/home.dart';
import 'package:aim/src/presentation/widgets/image_with_title_widget.dart';
import 'package:flutter/material.dart';

class MonthlyReportSummarySection extends StatelessWidget {
  final Home home;

  const MonthlyReportSummarySection({
    Key? key,
    required this.home,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).monthlyReportSummary,
          style: Theme.of(context).textTheme.headline3?.copyWith(
                fontWeight: semiBold,
              ),
        ),
        const SizedBox(height: 20),
        _buildRowItem(
          S.of(context).monthlyReports,
          "${home.numberofprojectMonthlyReportsCount}",
          ImagePaths.monthlyReport,
        ),
        const SizedBox(height: 12),
        _buildRowItem(
          S.of(context).submittedReports,
          "${home.numberofprojectMonthlyReportsSubmittedCount}",
          ImagePaths.submittedReport,
        ),
        const SizedBox(height: 12),
        _buildRowItem(
          S.of(context).unSubmittedReports,
          "${home.numberofprojectMonthlyReportsUnsubmittedCount}",
          ImagePaths.unSubmittedReport,
        ),
      ],
    );
  }

  ImageWithTitleWidget _buildRowItem(String title, String value, String image) {
    return ImageWithTitleWidget(
      padding: const EdgeInsets.all(16),
      image: image,
      title: title,
      value: value,
    );
  }
}
