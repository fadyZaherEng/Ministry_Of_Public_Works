import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProjectItemWidget extends StatelessWidget {
  final String title;
  final String value;
  final String imagePath;
  final Function()? onPressed;
  Color color;
  TextDirection? textDirection;
  int? maxLines;

  ProjectItemWidget(
      {Key? key,
      required this.title,
      required this.value,
      required this.imagePath,
      this.onPressed,
      this.textDirection,
      this.maxLines = 300,
      this.color = ColorSchema.primary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            imagePath,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.start,
                  maxLines: 5,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: ColorSchema.gray,
                        letterSpacing: -0.26,
                      ),
                ),
                const SizedBox(height: 6),
                InkWell(
                  onTap: () {
                    onPressed?.call();
                  },
                  child: Text(
                    value,
                    textAlign: TextAlign.start,
                    maxLines: maxLines,
                    textDirection: textDirection,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          letterSpacing: -0.26,
                          color: color,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
