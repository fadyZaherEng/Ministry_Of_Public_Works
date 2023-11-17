import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircularIconWidget extends StatelessWidget {
  final String imagePath;

  const CircularIconWidget({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: ColorSchema.orange,
        borderRadius: BorderRadius.circular(23),
      ),
      child: SvgPicture.asset(
        imagePath,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
