import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/presentation/screens/projects/details/widgets/circular_icon_widget.dart';
import 'package:flutter/material.dart';

class DownloadButtonWidget extends StatelessWidget {
  final String buttonText;
  final String imagePath;
  final Function() onTap;

  const DownloadButtonWidget({
    Key? key,
    required this.buttonText,
    required this.imagePath,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 4, right: 12),
        height: 45,
        decoration: BoxDecoration(
          color: ColorSchema.primary.withOpacity(0.08),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          children: [
            CircularIconWidget(
              imagePath: imagePath,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.caption?.copyWith(
                      letterSpacing: -0.24,
                    ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
