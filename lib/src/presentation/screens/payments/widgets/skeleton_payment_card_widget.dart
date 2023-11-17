import 'package:aim/src/presentation/widgets/skeleton/card_widget_skeleton.dart';
import 'package:aim/src/presentation/widgets/skeleton/skeleton_item_widget.dart';
import 'package:aim/src/presentation/widgets/skeleton/skeleton_row_widget.dart';
import 'package:flutter/material.dart';

class SkeletonPaymentCardWidget extends StatelessWidget {
  const SkeletonPaymentCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: CardWidgetSkeleton(
            content: Column(
              children: [
                const SizedBox(height: 16),
                const SkeletonRowWidget(),
                const SizedBox(height: 16),
                const SkeletonRowWidget(),
                const SizedBox(height: 16),
                const SkeletonRowWidget(),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 16, end: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SkeletonItemWidget(),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
