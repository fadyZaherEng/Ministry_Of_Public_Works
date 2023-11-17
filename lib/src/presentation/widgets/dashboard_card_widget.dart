import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';

class DashboardCardWidget extends StatelessWidget {
  final Widget child;
  EdgeInsets padding;
  DashboardCardWidget({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: ColorSchema.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 16,
            spreadRadius: 0,
            color: ColorSchema.black.withOpacity(0.1),
          )
        ],
      ),
      child: child,
    );
  }
}
