// ignore_for_file: deprecated_member_use

import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreItemWidget extends StatelessWidget {
  final String iconPath;
  final String title;
  final Function() onTap;
  Color textColor;

  MoreItemWidget(
      {Key? key,
      required this.iconPath,
      required this.title,
      required this.onTap,
      this.textColor = ColorSchema.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: SvgPicture.asset(
              iconPath,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: textColor,
                  letterSpacing: -0.26,
                ),
          ),
        ],
      ),
    );
  }
}
