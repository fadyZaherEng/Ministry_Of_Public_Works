import 'package:aim/src/presentation/widgets/skeleton/card_widget_skeleton.dart';
import 'package:aim/src/presentation/widgets/skeleton/skeleton_item_widget.dart';
import 'package:aim/src/presentation/widgets/skeleton/skeleton_row_widget.dart';
import 'package:flutter/material.dart';

class SkeletonMilestoneCardWidget extends StatelessWidget {
  const SkeletonMilestoneCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.all(8.0),
          child: CardWidgetSkeleton(
            content: Column(
              children: [
                SizedBox(height: 16),
                SkeletonRowWidget(),
                SizedBox(height: 16),
                SkeletonRowWidget(),
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 16, end: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkeletonItemWidget(),
                    ],
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
