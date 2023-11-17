import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';

Color priorityColor(double priority) {
  if (priority == 1.0) {
    return ColorSchema.barGreen;
  } else if (priority == 2.0) {
    return Colors.yellow;
  } else if (priority == 3.0) {
    return ColorSchema.barRed;
  } else {
    return ColorSchema.primary;
  }
}