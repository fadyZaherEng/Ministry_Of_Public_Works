import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ButtonWithIconWidget extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;
  final String icon;
  final Color backgroundColor;
  final Color titleColor;
  final Color iconColor;

  const ButtonWithIconWidget({
    Key? key,
    required this.onTap,
    required this.buttonTitle,
    required this.icon,
    this.backgroundColor = ColorSchema.primary,
    this.titleColor = ColorSchema.white,
    this.iconColor = ColorSchema.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ElevatedButton.icon(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: ColorSchema.buttonBorderGray))),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(color: ColorSchema.buttonBorderGray, width: 0),
          ),
        ),
        icon: SvgPicture.asset(
          height: 26,
          width: 26,
          icon,
          color: iconColor,
        ),
        onPressed: () => onTap(),
        label: Text(
          buttonTitle,
          style: TextStyle(
            color: titleColor,
            fontSize: 15,
            letterSpacing: -0.26,
            fontFamily: englishFontFamily,
            fontWeight: regular,
          ),
        ),
      ),
    );
  }
}
