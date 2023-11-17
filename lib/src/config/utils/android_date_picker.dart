import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:flutter/material.dart';

Future<DateTime?> androidDatePicker({
  required BuildContext context,
  required DateTime selectedDate,
}) async {
  return await showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(1900),
    lastDate: DateTime(DateTime.now().year + 20),
    builder: (context,child) {
      return Theme(data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(
          primary: ColorSchema.primary
        )
      ), child: child!);
    }
  );
}
