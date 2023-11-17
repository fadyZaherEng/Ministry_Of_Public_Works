import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/image_paths.dart';
import 'package:aim/src/presentation/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class YesNoDialogWidget extends StatelessWidget {
  final String dialogMessage;
  final Function() actionButtonOnTap;
  final Function() cancelButtonOnTap;
  final String actionButtonText;
  final String cancelButtonText;

  const YesNoDialogWidget({
    Key? key,
    required this.dialogMessage,
    required this.actionButtonOnTap,
    required this.cancelButtonOnTap,
    required this.cancelButtonText,
    required this.actionButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorSchema.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SvgPicture.asset(ImagePaths.download),
            const SizedBox(height: 14),
            Expanded(
              child: Text(
                dialogMessage,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(letterSpacing: -0.32),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ButtonWidget(
                    onTap: cancelButtonOnTap,
                    buttonTitle: cancelButtonText,
                    backgroundColor: ColorSchema.white,
                    borderColor: ColorSchema.buttonBorderGray,
                    titleColor: ColorSchema.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ButtonWidget(
                    onTap: actionButtonOnTap,
                    buttonTitle: actionButtonText,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
