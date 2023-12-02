import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckBoxWidget extends StatelessWidget {
  final bool isSelected;

  const CustomCheckBoxWidget({
    super.key,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? ColorSchema.primary : ColorSchema.barRed,
            width: 1,
          )),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? ColorSchema.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(7),
        ),
        child: SvgPicture.asset(
          ImagePaths.filter,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
