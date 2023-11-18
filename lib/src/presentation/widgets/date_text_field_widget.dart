import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DateTextFieldWidget extends StatelessWidget {
  final TextEditingController dateTextEditingController;
  final Function() onTap;
  final Function() onTapClearDateButton;
  final String hint;

  const DateTextFieldWidget({
    Key? key,
    required this.dateTextEditingController,
    required this.onTap,
    required this.onTapClearDateButton,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 45,
        child: TextField(
          controller: dateTextEditingController,
          onTap: onTap,
          readOnly: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: ColorSchema.gray,
                  letterSpacing: -0.26,
                ),
            suffixIcon: Container(
              margin: const EdgeInsetsDirectional.only(end: 2),
              child: dateTextEditingController.text.isNotEmpty
                  ? InkWell(
                      onTap: onTapClearDateButton,
                      child: SvgPicture.asset(
                        ImagePaths.close,
                        fit: BoxFit.scaleDown,
                      ),
                    )
                  : SvgPicture.asset(
                      ImagePaths.calendar,
                      fit: BoxFit.scaleDown,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
