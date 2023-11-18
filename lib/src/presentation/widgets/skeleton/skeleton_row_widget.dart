import 'package:aim/src/presentation/widgets/skeleton/skeleton_item_widget.dart';
import 'package:flutter/material.dart';

class SkeletonRowWidget extends StatelessWidget {
  const SkeletonRowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsetsDirectional.only(
        start: 16,
        end: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonItemWidget(),
          SkeletonItemWidget(),
        ],
      ),
    );
  }
}
