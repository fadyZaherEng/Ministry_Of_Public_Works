import 'package:aim/src/config/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularIndicator extends StatefulWidget {
  final double radius;
  final double lineWidth;
  final Color backGroundColor;
  final Color progressColor;
  final double percent;
  final String title;

  const CircularIndicator({
    Key? key,
    required this.radius,
    required this.lineWidth,
    required this.backGroundColor,
    required this.progressColor,
    required this.percent,
    required this.title,
  }) : super(key: key);

  @override
  State<CircularIndicator> createState() => _CircularIndicatorState();
}

class _CircularIndicatorState extends State<CircularIndicator> {
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: widget.radius,
      lineWidth: widget.lineWidth,
      backgroundColor: widget.backGroundColor,
      progressColor: widget.progressColor,
      percent: widget.percent,
      center: Text(
        widget.title,
        style: Theme
            .of(context)
            .textTheme
            .caption
            ?.copyWith(
            letterSpacing: -0.24,
            fontWeight: medium
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      animation: true,
      animationDuration: 1000,
    );
  }
}
