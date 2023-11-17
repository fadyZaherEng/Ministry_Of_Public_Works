import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ButtonOverViewWidegt extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSuffixIcon;
  final Function() onPressed;

  const ButtonOverViewWidegt({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.isSuffixIcon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            backgroundColor: ColorSchema.primary,
            elevation: 0,
            side: const BorderSide(color: ColorSchema.buttonBorderGray),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (!isSuffixIcon)
                SvgPicture.asset(
                  imagePath,
                  width: 20,
                  height: 20,
                ),
              if (!isSuffixIcon) const SizedBox(width: 3),
              Text(title),
              if (isSuffixIcon) const SizedBox(width: 3),
              if (isSuffixIcon)
                SvgPicture.asset(
                  imagePath,
                  width: 20,
                  height: 20,
                  matchTextDirection: true,
                ),
            ],
          )),
    );
  }
}
