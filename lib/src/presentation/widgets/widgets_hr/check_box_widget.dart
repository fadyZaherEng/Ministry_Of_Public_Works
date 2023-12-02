import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/presentation/widgets/widgets_hr/custom_check_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:aim/generated/l10n.dart';

class CheckboxWidget extends StatelessWidget {
  final bool isSelected;
  final Function() onTap;
  final String? title;

  const CheckboxWidget({
    super.key,
    required this.isSelected,
    required this.onTap,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          CustomCheckBoxWidget(
            isSelected: isSelected,
          ),
          const SizedBox(width: 16),
          Text("tttttttt",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: ColorSchema.gray,
                  )),
        ],
      ),
    );
  }
}
