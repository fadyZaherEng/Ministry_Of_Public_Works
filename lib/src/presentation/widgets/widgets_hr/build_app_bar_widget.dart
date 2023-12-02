import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar buildAppBarWidget(
  BuildContext context, {
  required String title,
  required bool isHaveBackButton,
  Function()? onBackButtonPressed,
  Color backgroundColor = ColorSchema.white,
  Widget actionWidget = const SizedBox.shrink(),
}) {
  return AppBar(
    backgroundColor: backgroundColor,
    shadowColor: const Color.fromRGBO(0, 0, 0, 0.4),
    elevation: 5,
    title: Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
          letterSpacing: -0.24,
          fontWeight: FontWeight.w600,
          color: ColorSchema.black),
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    ),
    centerTitle: true,
    actions: [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          actionWidget,
        ],
      )
    ],
    leading: isHaveBackButton
        ? InkWell(
            onTap: onBackButtonPressed ?? () {},
            child: SvgPicture.asset(
              ImagePaths.arrowBack,
              matchTextDirection: true,
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
            ),
          )
        : const SizedBox.shrink(),
  );
}
