// ignore_for_file: deprecated_member_use

import 'package:aim/src/presentation/widgets/bar_color_widget.dart';
import 'package:flutter/material.dart';

class BarColorItemWidget extends StatelessWidget {
  final BarColorModel barColor;

  const BarColorItemWidget({
    Key? key,
    required this.barColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: barColor.color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          barColor.title,
          style: Theme.of(context)
              .textTheme
              .caption
              ?.copyWith(letterSpacing: -0.24),
        ),
      ],
    );
  }
}
