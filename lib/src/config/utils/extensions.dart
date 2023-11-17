import 'package:intl/intl.dart';

extension FormatDoubleWithComma on double {
  String formatWithComma() {
    final numberFormat = NumberFormat.decimalPattern('en');
    return numberFormat.format(this);
  }
}

extension FormatStringDoubleWithComma on String {
  String formatDoubleWithComma() {
    double value = double.tryParse(this) ?? 0.0;
    return value.formatWithComma();
  }
}