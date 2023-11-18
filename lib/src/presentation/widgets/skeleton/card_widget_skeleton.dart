import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class CardWidgetSkeleton extends StatelessWidget {
  final Widget content;

  const CardWidgetSkeleton({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorSchema.projectCardBorderGray),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 16,
            spreadRadius: 0,
            color: ColorSchema.black.withOpacity(0.1),
          )
        ],
        color: ColorSchema.projectNameSectionGray,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: ColorSchema.projectNameSectionGray,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: const SkeletonLine(
              style: SkeletonLineStyle(
                height: 7,
                width: 100,
                maxLength: double.infinity,
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                color: ColorSchema.white),
            child: content,
          ),
        ],
      ),
    );
  }
}
