import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonCircularIcon extends StatelessWidget {
  const SkeletonCircularIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: ColorSchema.orange,
        borderRadius: BorderRadius.circular(23),
      ),
      child: const SkeletonAvatar(
        style: SkeletonAvatarStyle(
          shape: BoxShape.circle,
          width: 15,
          height: 15,
        ),
      ),
    );
  }
}
