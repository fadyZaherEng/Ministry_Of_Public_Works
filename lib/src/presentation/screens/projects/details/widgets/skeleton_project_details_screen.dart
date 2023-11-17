import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/presentation/screens/projects/details/widgets/skeleton_circular_icon.dart';
import 'package:aim/src/presentation/widgets/skeleton/skeleton_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonProjectDetailsScreen extends StatelessWidget {
  const SkeletonProjectDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SkeletonRowWidget(),
        const SizedBox(height: 16),
        const SkeletonRowWidget(),
        const SizedBox(height: 16),
        const SkeletonRowWidget(),
        const SizedBox(height: 16),
        const SkeletonRowWidget(),
        const SizedBox(height: 32),
        GridView.count(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 1.8,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            _buildSkeletonProjectDetailsWidget(),
            _buildSkeletonProjectDetailsWidget(),
            _buildSkeletonProjectDetailsWidget(),
            _buildSkeletonProjectDetailsWidget(),
            _buildSkeletonProjectDetailsWidget(),
            _buildSkeletonProjectDetailsWidget(),
            _buildSkeletonProjectDetailsWidget(),
            _buildSkeletonProjectDetailsWidget(),
          ],
        ),
        const SizedBox(height: 36),
        Row(
          children: [
            Expanded(child: Container(
              padding: const EdgeInsets.only(left: 4, right: 12),
              height: 45,
              decoration: BoxDecoration(
                color: ColorSchema.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(23),
              ),
              child: Row(
                children: [
                  SkeletonCircularIcon(),
                  const SizedBox(width: 6),
                  const SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 7, width: 60, maxLength: double.infinity),
                  ),
                ],
              ),
            )),
            Expanded(child: Container(
              padding: const EdgeInsets.only(left: 4, right: 12),
              height: 45,
              decoration: BoxDecoration(
                color: ColorSchema.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(23),
              ),
              child: Row(
                children: [
                  SkeletonCircularIcon(),
                  const SizedBox(width: 6),
                  const SkeletonLine(
                    style: SkeletonLineStyle(
                        height: 7, width: 60, maxLength: double.infinity),
                  ),
                ],
              ),
            )),
          ],
        ),
      ],
    );
  }

  _buildSkeletonProjectDetailsWidget() {
    return Container(
      width: 210,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 16,
              color: ColorSchema.black.withOpacity(0.1))
        ],
        color: ColorSchema.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SkeletonAvatar(
                style: SkeletonAvatarStyle(
                  borderRadius: BorderRadius.circular(4),
                  shape: BoxShape.rectangle,
                  width: 42,
                  height: 42,
                ),
              ),
              const Expanded(child: SizedBox()),
              const SkeletonLine(
                style: SkeletonLineStyle(
                    height: 7, width: 20, maxLength: double.infinity),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const SkeletonLine(
            style: SkeletonLineStyle(
                height: 7, width: 100, maxLength: double.infinity),
          ),
        ],
      ),
    );
  }
}
