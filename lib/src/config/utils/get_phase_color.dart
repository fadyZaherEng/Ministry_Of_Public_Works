import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';

Color getPhaseColor(String phaseName) {
  return ColorSchema.primary;

  if(phaseName.trim() == "Execution" || phaseName.trim() == "التنفيذ"){
    return ColorSchema.barRed;
  } else if(phaseName.trim() == "Design" || phaseName.trim() == "التصميم"){
    return ColorSchema.barGreen;
  } else if(phaseName.trim() == "Tendering" || phaseName.trim() == "الطرح و الترسية"){
    return Colors.yellow;
  } else {
    return ColorSchema.primary;
  }
}