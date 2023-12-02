import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/presentation/widgets/widgets_hr/custom_button_widget.dart';
import 'package:aim/src/presentation/widgets/widgets_hr/custom_gradient_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionDialogWidget extends StatelessWidget {
  final String text;
  final String icon;
  final String primaryText;
  final String secondaryText;
  final Function() primaryAction;
  final Function() secondaryAction;

  const ActionDialogWidget(
      {Key? key,
      required this.text,
      required this.icon,
      required this.primaryText,
      required this.secondaryText,
      required this.primaryAction,
      required this.secondaryAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorSchema.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              const SizedBox(height: 16.2),
              Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: ColorSchema.black, letterSpacing: -0.24),
              ),
              const SizedBox(height: 32.0),
              Row(
                children: [
                  Expanded(
                    child: CustomButtonWidget(
                      borderColor: ColorSchema.gray,
                      height: 44,
                      onTap: secondaryAction,
                      textColor: ColorSchema.gray,
                      backgroundColor: ColorSchema.white,
                      text: secondaryText,
                    ),
                  ),
                  const SizedBox(
                    width: 23,
                  ),
                  Expanded(
                      child: CustomGradientButtonWidget(
                          height: 44, onTap: primaryAction, text: primaryText)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
