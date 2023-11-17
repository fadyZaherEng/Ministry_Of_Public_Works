import 'package:aim/src/presentation/widgets/skeleton/card_widget_skeleton.dart';
import 'package:aim/src/presentation/widgets/skeleton/skeleton_row_widget.dart';
import 'package:flutter/material.dart';

class SkeletonRisksCardWidget extends StatelessWidget {
  const SkeletonRisksCardWidget({Key? key}) : super(key: key);

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
              children: const [
                SizedBox(height: 16),
                SkeletonRowWidget(),
                SizedBox(height: 16),
                SkeletonRowWidget(),
                SizedBox(height: 16),
                SkeletonRowWidget(),
                SizedBox(height: 16),
                SkeletonRowWidget(),
                SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
