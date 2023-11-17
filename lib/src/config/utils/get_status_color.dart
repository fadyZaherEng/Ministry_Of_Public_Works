import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';

Color getStatusColor(String status) {
  if(status.toLowerCase() == "closed" || status.toLowerCase() == "مغلق") {
    return ColorSchema.red;
  } else {
    return ColorSchema.barGreen;
  }
}